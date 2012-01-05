#' Kernel Local Fisher Discriminant Analysis for
#' Supervised Dimensionality Reduction
#'
#' Performs kernel local fisher discriminant analysis on the given data.
#' 
#' Put KLFDA function details here.
#' The eigenvectors calculation of sparse matrices
#' invokes the ARPACK library interface provided by igraph package.
#' 
#' @param k n x n kernel matrix
#'          n --- the number of samples
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
#' @note put some note here
#' 
#' @author Xiao Nan \email{road2stat@gmail.com}
#' 
#' @seealso \code{\link{lfda}} the linear version
#' 
#' @export
#' 
#' @references Venables, W. N. and Ripley, B. D. (2002) \emph{Modern
#' Applied Statistics with S}. Fourth edition. Springer.
#' 
#' @examples
#' klfda(letters)
#' klfda(c("i", "like", "programming", NA))

require(igraph)  # delete this when test is done

kmatrixGauss = function(x, sigma) {



}

klfda <- function (k, y, r, metric, knn, reg) {



}
