#' Kernel Discriminative Component Analysis
#'
#' Performs kernel discriminative component analysis on the given data.
#' 
#' Put KDCA function details here.
#' 
#' @param  k n x n kernel matrix. Result of the \code{\link{kmatrixGauss}} function.
#'         n is the number of samples.
#' @param chunks \code{n * 1} vector describing the chunklets:
#'               \code{-1} in the \code{i} th place means that point \code{i}
#'               doesn\'t belong to any chunklet;
#'               integer \code{j} in place \code{i} means that point \code{i}
#'               belongs to chunklet j.
#'               The chunklets indexes should be 1:(number of chunklets).
#' @param neglinks \code{s * s} matrix describing the negative relationship
#'                 between all the \code{s} chunklets.
#'                 For the element \eqn{neglinks_{ij}}:
#'                 \eqn{neglinks_{ij} = 1} means chunklet \code{i} and chunklet {j} 
#'                 have negative constraint(s);
#'                 \eqn{neglinks_{ij} = -1} means chunklet \code{i} and chunklet {j}
#'                 don\'t have negative constraints
#'                 or we don\'t have information about that.
#' @param useD optional. When not given, DCA is done in the original dimension
#'             and B is full rank. When useD is given, DCA is preceded by
#'             constraints based LDA which reduces the dimension to useD.
#'             B in this case is of rank useD.
#' 
#' @return list of the KDCA results:
#' \item{B}{KDCA suggested Mahalanobis matrix}
#' \item{DCA}{KDCA suggested transformation of the data.
#'            The dimension is (original data dimension) * (useD)}
#' \item{newData}{KDCA transformed data}
#' 
#' @keywords dca kdca discriminant component transformation mahalanobis metric
#'
#' @aliases kdca
#' 
#' @note Put some note here.
#' 
#' @author Xiao Nan <\url{http://www.road2stat.com}>
#' 
#' @seealso See \code{\link{kmatrixGauss}} for the Gaussian kernel computation,
#'          and \code{\link{dca}} for the linear version of DCA.
#'
#' @export kdca
#' 
#' @references
#' Steven C.H. Hoi, W. Liu, M.R. Lyu and W.Y. Ma (2006).
#' Learning Distance Metrics with Contextual Constraints for Image Retrieval.
#  \emph{Proceedings IEEE Conference on Computer Vision and Pattern Recognition
#' (CVPR2006)}.
#'
#' @examples
#' kdca(NULL)

kdca <- function(k, chunks, neglinks, useD) {

NULL

}

