#' @title Calculates the Corrected Covered Area (CCA) Index
#'
#' @description This package calculates the Corrected Covered Area (CCA) index. The measure for assessing the overall degree of overlap in an OoSR. It is taking as input the citation matrix.
#'
#' @param cm A dataframe for the citation matrix
#'
#' @return res
#'
#' @example man/examples/example.R
#'
#' @export

cca <- function(cm){

    studies<-nrow(cm)
    reviews<-ncol(cm)

    N <-c()
    r<-c()
    c<-c()
    CCA_Proportion<-c()
    CCA_Percentage<-c()

    j<-t(utils::combn(reviews,2))


    for (i in 1:nrow(j)){

        cm2<-cm[j[i,]]

        reviews[i]<-paste(colnames(cm2[1]), "vs." ,colnames(cm2[2]))

        N[i]<- sum(cm2)

        r[i]<-nrow(cm2[as.logical(rowSums(cm2 != 0)), ])

        c[i]<-ncol(cm2)

        CCA_Proportion[i] <- (N[i]-r[i])/((r[i]*c[i])-r[i])

        CCA_Percentage[i] <- CCA_Proportion[i]*100
    }

    overall<-nrow(j)+1
    reviews[overall]<-"Overall"
    N[overall]<-sum(cm)
    r[overall]<-nrow(cm)
    c[overall]<-ncol(cm)
    CCA_Proportion[overall] <- (N[overall]-r[overall])/((r[overall]*c[overall])-r[overall])
    CCA_Percentage[overall] <- CCA_Proportion[overall]*100

    res<- data.frame(reviews,N,r,c,CCA_Proportion,CCA_Percentage,stringsAsFactors=FALSE)

#    return(res)

}

