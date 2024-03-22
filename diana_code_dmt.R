# Load required libraries
library(cluster)
library(tidyverse)
library(factoextra)
library(carData)

# Read the data from CSV file
df <- read.csv("C:/Users/ShyamVenkatraman/Pictures/data.csv")

# Select relevant columns for clustering
data <- df[, c("Latitude", "Longtude")]

# Remove rows with missing values
data <- na.omit(data)

# Compute dissimilarity matrix
dist_matrix <- dist(data)

# Perform DIANA clustering with k=2
diana_result <- diana(data, metric = "euclidean")

# Extract cluster membership from diana_result
cluster_membership <- cutree(diana_result, k = 2)

# Add cluster membership to the data
data_with_clusters <- cbind(data, cluster = factor(cluster_membership))

# Compute silhouette widths
sil_widths <- silhouette(cluster_membership, dist_matrix)

# Plot silhouette widths
fviz_silhouette(sil_widths)

# Visualize the clusters using ggplot2
ggplot(data_with_clusters, aes(x = Longtude, y = Latitude, color = cluster)) +
  geom_point() +
  labs(title = "Clusters of Data Points", x = "Longitude", y = "Latitude") +
  theme_minimal()

# Plot dendrogram
fviz_dend(as.dendrogram(diana_result), k = 2)
