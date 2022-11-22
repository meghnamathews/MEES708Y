#M.Mathews

#This function plots my function to plot a time series from the AD_cluster_3 dataset
read.csv("AD_cluster_3.csv")

ad <- read.csv("AD_cluster_3.csv")

#### dataset for source figure
library(dplyr)
library(ggplot2)

x <- read.csv("AD_cluster_3.csv")


## function

myplot <- function(x, plotmean = FALSE, color = "green"){
  if ((is.null(dim(x))) == TRUE){
    stop("cannot calculate quantiles per time point")
  }
  x = as.data.frame(x) ## converting to dataframe
  if (ncol(x) == 1){
    x <- tibble::rownames_to_column(x, "Year")
  }
  ggplot(data = AD_cluster_3.csv)
  ## converting to numeric value
  x[,1] <- as.numeric(x[,1])
  ## x <- subset(x,!is.na(x[,2]))
  m = apply(select(x,-Year), 1, mean,na.rm = TRUE)
  med = apply(select(x,-Year), 1, median,na.rm = TRUE)
  Q1 = apply(x, 1, quantile, na.rm = TRUE, probs = 0.25)
  Q3 = apply(x, 1, quantile, na.rm = TRUE, probs = 0.75)
  
  p = ggplot() + aes(x[,1], med) +
    geom_line() 
  
  if (plotmean){
    p = p +
      geom_line(aes(x[,1], m), color = "black")
  }
  print(p)
  return(p)
  
  
  # ggplot() + aes(x[,1],x[,2]) +
  geom_point() +
    geom_line(aes(x[,1],x[,2]),color = "black") +
    ggtitle("Cluster 3") +
    xlab("Year") + ylab("Attainment deficit (%)") +
    theme(plot.title.position = "plot") +
    geom_quantile(aes(quantiles = Q1, color = "green"), method = "rqss") +
    geom_hline(aes(yintercept = mean(x[,2], na.rm=TRUE), color = "blue")) +
    geom_hline(aes(yintercept = median(x[,2], na.rm=TRUE), color = "green")) +
    scale_color_hue(labels = c("mean","median","quantiles")) + theme_classic()
  
} else {
  x %>%
    ggplot() + aes(x[,1],x[,2]) +
    geom_point() +
    geom_line(aes(x[,1],x[,2]),color = "black") +
    ggtitle("Cluster 3") +
    xlab("Year") + ylab("Attainment deficit (%)") +
    geom_quantile(aes(quantiles = Q1, color = "green"), method = "rqss") +
    geom_hline(aes(yintercept = median(x[,2], na.rm=TRUE), color = "gray")) +
    scale_color_hue(labels = c("quantiles", "median")) +
    theme(plot.title.position = "plot") + theme_classic()
}
