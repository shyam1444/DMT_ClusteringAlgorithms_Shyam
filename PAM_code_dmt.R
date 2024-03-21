library(cluster)
library(tidyverse)
library(factoextra)
library(FactoMineR)

df <- read.csv("C:/Users/ShyamVenkatraman/Pictures/data.csv")

if (nrow(df_numeric) > 0 && ncol(df_numeric) > 0) {
  fviz_nbclust(df_numeric, FUNcluster = pam, method = "silhouette") + theme_classic()
} else {
  print("No numeric columns found in the dataframe for clustering analysis.")
}
fviz_nbclust(df_numeric, FUNcluster = pam, method = "wss") + theme_classic()

#This method shows that the least no of clusters which can be is 2
fviz_nbclust(df_numeric, FUNcluster = pam, method = "wss") + theme_classic()

myc = pam(df,2,metric = "euclidean", stand = FALSE)
myc

df_numeric <- df[, sapply(df, is.numeric)]
df_scaled <- scale(df_numeric)
my_cluster <- kmeans(df_scaled, centers = 2)
fviz_cluster(my_cluster, data = df_scaled, geom = "point", ellipse.type = "convex", ggtheme = theme_bw())
