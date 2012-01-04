#' Local Fisher Discriminant Analysis for
#' Supervised Dimensionality Reduction
#'
#' Performs local fisher discriminant analysis on the given data.
#' 
#' Put LFDA function details here.
#' 
#' @param x d x n matrix of original samples
#'          n --- the number of samples 
#' @param y n dimensional vector of class labels
#' @param r dimensionality of reduced space (default: d)
#' @param metric type of metric in the embedding space (default: 'weighted')
#'               'weighted'        --- weighted eigenvectors 
#'               'orthonormalized' --- orthonormalized
#'               'plain'           --- raw eigenvectors
#' @param knn parameter used in local scaling method (default: 7)
#' 
#' @return list of the LFDA results:
#' \item{T}{d x r transformation matrix (Z = T' * X)}
#' \item{Z}{r x n matrix of dimensionality reduced samples}
#' 
#' @keywords lfda local fisher discrminant transformation mahalanobis metric
#'
#' @note put some note here
#' 
#' @author Xiao Nan \email{road2stat@gmail.com}
#' 
#' @seealso \code{\link{klfda}} the non-linear extension using kernel trick
#' 
#' @export
#' 
#' @references Venables, W. N. and Ripley, B. D. (2002) \emph{Modern
#' Applied Statistics with S}. Fourth edition. Springer.
#' 
#' @examples
#' lfda(letters)
#' lfda(c("i", "like", "programming", NA))

lfda <- function(x, y, r, metric, knn) {



}

