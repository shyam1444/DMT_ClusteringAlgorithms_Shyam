# Libraries
library(cluster)
library(tidyverse)
library(factoextra)
library(FactoMineR)

# Reading the CSV file
df <- read.csv("C:/Users/ShyamVenkatraman/Pictures/data.csv")

# Displaying the representation
# Check if there are numeric columns in the dataframe for clustering analysis
df_numeric <- df[, sapply(df, is.numeric)]
if (nrow(df_numeric) > 0 && ncol(df_numeric) > 0) {
  # Determine optimal number of clusters using silhouette method
  fviz_nbclust(df_numeric, FUNcluster = pam, method = "silhouette") + theme_classic()
} else {
  print("No numeric columns found in the dataframe for clustering analysis.")
}

# Determine optimal number of clusters using within-cluster sum of squares method
fviz_nbclust(df_numeric, FUNcluster = pam, method = "wss") + theme_classic()

# Determine optimal number of clusters using within-cluster sum of squares method
fviz_nbclust(df_numeric, FUNcluster = pam, method = "wss") + theme_classic()

# Perform k-means clustering with 2 clusters
my_cluster <- pam(df, 2, metric = "euclidean", stand = FALSE)
my_cluster

# Scale the numeric columns
df_scaled <- scale(df_numeric)

# Perform k-means clustering on scaled data
my_cluster <- kmeans(df_scaled, centers = 2)

# Visualize the clusters
fviz_cluster(my_cluster, data = df_scaled, geom = "point", ellipse.type = "convex", ggtheme = theme_bw())
