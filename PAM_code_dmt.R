library(cluster)
library(tidyverse)
library(factoextra)
library(FactoMineR)
df <- read.csv("C:/Users/ShyamVenkatraman/Pictures/data.csv")
df_numeric <- df[, sapply(df, is.numeric)]
if (nrow(df_numeric) > 0 && ncol(df_numeric) > 0) {
  fviz_nbclust(df_numeric, FUNcluster = pam, method = "silhouette") + theme_classic()
} else {
  print("No numeric columns found in the dataframe for clustering analysis.")
}

myc = pam(df,2,metric = "euclidean", stand = FALSE)
myc

df_numeric <- df[, sapply(df, is.numeric)]
df_scaled <- scale(df_numeric)
my_cluster <- kmeans(df_scaled, centers = 3)
fviz_cluster(my_cluster, data = df_scaled, geom = "point", ellipse.type = "convex", ggtheme = theme_bw())
