# Load required libraries
library(cluster)
library(tidyverse)

# Read the data from CSV file
df <- read.csv("C:/Users/ShyamVenkatraman/Pictures/data.csv")

# Check summary and structure of the dataframe
summary(df)
str(df)

# Impute missing values in Latitude and Longitude columns
df$Latitude <- ifelse(is.na(df$Latitude), median(df$Latitude, na.rm = TRUE), df$Latitude)
df$Longtude <- ifelse(is.na(df$Longtude), median(df$Longtude, na.rm = TRUE), df$Longtude)

# Select relevant columns for clustering
data_for_clustering <- df[, c("Latitude", "Longtude")]

# Perform hierarchical clustering
hc <- hclust(dist(data_for_clustering))

# Plot the dendrogram
plot(hc, main = "Dendrogram of Hierarchical Clustering", xlab = "Index", ylab = "Distance")

# Cut the dendrogram into clusters
clusters <- cutree(hc, k = 3)  # You can adjust the number of clusters as needed

# Attach cluster labels to the original dataframe
df$Cluster <- clusters

# View the resulting dataframe with cluster labels
head(df)
tail(df)
