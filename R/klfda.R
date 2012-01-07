#' Kernel Local Fisher Discriminant Analysis for
#' Supervised Dimensionality Reduction
#'
#' Performs kernel local fisher discriminant analysis on the given data.
#' 
#' Put KLFDA function details here.
#' The eigenvectors calculation of sparse matrices
#' invokes the ARPACK library interface provided by igraph package.
#' 
#' @param k n x n kernel matrix. Result of the \code(\link{kmatrixGauss}) function.
#'          n is the number of samples.
#' @param y n dimensional vector of class labels
#' @param r dimensionality of reduced space (default: d)
#' @param metric type of metric in the embedding space (default: 'weighted')
#'               'weighted'        --- weighted eigenvectors 
#'               'orthonormalized' --- orthonormalized
#'               'plain'           --- raw eigenvectors
#' @param knn parameter used in local scaling method (default: 7)
#' @param reg regularization parameter (default: 0.001)
#' 
#' @return list of the LFDA results:
#' \item{T}{d x r transformation matrix (Z = T' * X)}
#' \item{Z}{r x n matrix of dimensionality reduced samples}
#' 
#' @keywords klfda local fisher discriminant transformation mahalanobis metric
#'
#' @note Put some note here.
#' 
#' @author Xiao Nan \email{road2stat@gmail.com}
#' 
#' @seealso See \code{\link{lfda}} for the linear version.
#' 
#' @importFrom igraph arpack
#'
#' @export klfda
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
#' klfda(letters)
#' klfda(c("i", "like", "programming", NA))

repmat <- function(A, N, M) {
	kronecker(matrix(1, N, M), A)
}

klfda <- function (k, y, r, metric = c('weighted', 'orthonormalized', 'plain'), 
                   knn = 7, reg = 0.001) {

	metric = match.arg(metric)

	y = t(as.matrix(y))

	n = nrow(k)

	if(is.null(r)) r = n

	tSb = mat.or.vec(n, n)
	tSw = mat.or.vec(n, n)

	for (i in unique(as.vector(t(y)))) {

	Kcc = k[y == i, y == i]
	Kc = k[, y == i]
	nc = nrow(Kcc)

	# Define classwise affinity matrix
	Kccdiag = diag(as.vector(Kcc))
	distance2 = repmat(Kccdiag, 1, nc) + repmat(t(Kccdiag), nc, 1) - 2 * Kcc

	sorted = apply(distance2, 2, sort)
	index = apply(distance2, 2, order)

	kNNdist2 = t(as.matrix(sorted[knn + 1, ]))
	sigma = sqrt(kNNdist2)
	localscale = t(sigma) %*% sigma
	flag = (localscale != 0)
	A = mat.or.vec(nc, nc)
	A[flag] = exp(-distance2[flag]/localscale[flag])

	Kc1 = as.matrix(rowSums(Kc))
	Z = Kc %*% (repmat(as.matrix(colSums(A)), 1, n) * t(Kc)) - Kc %*% A %*% t(Kc)
	tSb = tSb + (Z/n) + Kc %*% t(Kc) * (1 - nc/n) + Kc1 %*% (t(Kc1)/n)
	tSw = tSw + Z/nc
	}

	K1 = as.matrix(rowSums(k))
	tSb = tSb - K1 %*% t(K1)/n - tSw

	tSb = (tSb + t(tSb))/2
	tSw = (tSw + t(tSw))/2

	eigTmp = igraph::arpack(tSb, 
	         tSw + reg * diag(1, nrow(tSw), ncol(tSw)), r, 'LA')  # To be edited here!
	eigVec = eigTmp$vectors
	eigVal = as.matrix(eigTmp$values)

	T0 = eigVec

	T = switch(metric,
			   weighted = T0 * repmat(t(sqrt(eigVal)), n, 1),
			   orthonormalized = qr.Q(qr(T0)),  # QR result little different Here!
			   plain = T0
			   )

	Z = t(t(T) %*% k)

	return(list(T, Z))
}

