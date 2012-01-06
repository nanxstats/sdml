#' Gaussian Kernel Computation for
#' Kernel Local Fisher Discriminant Analysis
#'
#' Gaussian kernel computation for klfda.
#' 
#' Put kmatrixGauss function details here.
#' 
#' @param x n x d matrix of original samples.
#'          n is the number of samples.
#' @param sigma dimensionality of reduced space. (default: 0.001)
#' 
#' @return K n x n kernel matrix.
#'           n is the number of samples.
#' 
#' @keywords klfda kernel local fisher discriminant
#'           transformation mahalanobis metric
#'
#' @note Put some note here.
#' 
#' @author Xiao Nan \email{road2stat@gmail.com}
#' 
#' @seealso See \code{klfda} for the computation of
#'          kernel local fisher discriminant analysis
#' 
#' @export kmatrixGauss
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

kmatrixGauss = function(x, sigma = 1) {
x = t(as.matrix(x))
d = nrow(x)
n = ncol(x)
X2 = t(as.matrix(colSums(x^2)))
distance2 = repmat(X2, n, 1) + repmat(t(X2), 1, n) - 2 * t(X) %*% X
K = exp(-distance2/(2 * sigma^2)) # To be tested
return(K)
}

