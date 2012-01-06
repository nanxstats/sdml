#' Local Fisher Discriminant Analysis for
#' Supervised Dimensionality Reduction
#'
#' Performs local fisher discriminant analysis on the given data.
#' 
#' Put LFDA function details here.
#' The eigenvectors calculation of sparse matrices
#' invokes the ARPACK library interface provided by igraph package.
#' 
#' @param x n x d matrix of original samples.
#'          n is the number of samples.
#' @param y length n vector of class labels
#' @param r dimensionality of reduced space (default: d)
#' @param metric type of metric in the embedding space (default: 'weighted')
#'               'weighted'        --- weighted eigenvectors 
#'               'orthonormalized' --- orthonormalized
#'               'plain'           --- raw eigenvectors
#' @param knn parameter used in local scaling method (default: 7)
#' 
#' @return list of the LFDA results:
#' \item{T}{d x r transformation matrix (Z = x * T)}
#' \item{Z}{n x r matrix of dimensionality reduced samples}
#' 
#' @keywords lfda local fisher discriminant transformation mahalanobis metric
#'
#' @note put some note here
#' 
#' @author Xiao Nan \email{road2stat@gmail.com}
#' 
#' @seealso See \code{\link{klfda}} for the kernelized variant of
#'          LFDA (Kernel LFDA).
#' 
#' @importFrom igraph arpack
#'
#' @export lfda
#' 
#' @references Sugiyama, M.
#' Dimensionality reduction of multimodal labeled data by
#' local Fisher discriminant analysis.
#' \emph{Journal of Machine Learning Research}, vol.8 (May), pp.1027-1061, 2007.
#' 
#' Sugiyama, M.
#' Local Fisher discriminant analysis for supervised dimensionality reduction.
#' In W. W. Cohen and A. Moore (Eds.), \emph{Proceedings of 23rd International
#' Conference on Machine Learning (ICML2006)}, pp.905-912, Pittsburgh,
#' Pennsylvania, USA, Jun. 25-29, 2006.
#' 
#' @examples
#' lfda(letters)
#' lfda(c("i", "like", "programming", NA))

require(igraph)  # delete when test is done
x = as.matrix(read.csv('~/X.csv', header = FALSE))  # delete when test done
y = as.matrix(read.csv('~/Y.csv', header = FALSE))  # delete when test done

repmat <- function(A, N, M) {
  kronecker(matrix(1, N, M), A)
}

lfda <- function(x, y, r, metric = c('weighted', 
                 'orthonormalized', 'plain'), knn = 7) {

metric = match.arg(metric)

x = t(as.matrix(x))
y = t(as.matrix(y))

d = nrow(x)
n = ncol(x)

if(is.null(r)) r = d

tSb = mat.or.vec(d, d)
tSw = mat.or.vec(d, d)

for (i in unique(as.vector(t(y)))) {

Xc = x[, y == i]
nc = ncol(Xc)

# Define classwise affinity matrix
Xc2 = t(as.matrix(colSums(Xc^2)))
distance2 = repmat(Xc2, nc, 1) + repmat(t(Xc2), 1, nc) - 2 * t(Xc) %*% Xc

sorted = apply(distance2, 2, sort)
index = apply(distance2, 2, order)

kNNdist2 = t(as.matrix(sorted[knn + 1, ]))
sigma = sqrt(kNNdist2)
localscale = t(sigma) %*% sigma
flag = (localscale != 0)
A = mat.or.vec(nc, nc)
A[flag] = exp(-distance2[flag]/localscale[flag])

Xc1 = as.matrix(rowSums(Xc))
G = Xc %*% (repmat(as.matrix(colSums(A)), 1, d) * t(Xc)) - Xc %*% A %*% t(Xc)
tSb = tSb + (G/n) + Xc %*% t(Xc) * (1 - nc/n) + Xc1 %*% (t(Xc1)/n)
tSw = tSw + G/nc
}

X1 = as.matrix(rowSums(x))
tSb = tSb - X1 %*% t(X1)/n - tSw

tSb = (tSb + t(tSb))/2
tSw = (tSw + t(tSw))/2

if (r == d) {
eigTmp = eigen(solve(tSw) %*% tSb)  # Note: Differ from LFDA MATLAB implemention
                                    # Eigenvectors here are normalized
eigVec = eigTmp$vectors
eigVal = as.matrix(eigTmp$values)
}
else {
eigTmp = igraph::arpack(tSb, tSw, r, 'LA')  # To be edited here!!
eigVec = eigTmp$vectors
eigVal = as.matrix(eigTmp$values)
}

T0 = eigVec

T = switch(metric,
           weighted = T0 * repmat(t(sqrt(eigVal)), d, 1),
           orthonormalized = qr.Q(qr(T0)), # QR result little different Here!
           plain = T0
)

Z = t(t(T) %*% x)

return(list(T, Z))
}

