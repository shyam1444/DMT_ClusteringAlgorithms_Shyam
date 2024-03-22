# Generate sample data (replace this with your actual data)
set.seed(123)
data <- read.csv("C:/Users/ShyamVenkatraman/Pictures/data.csv")

# Perform hierarchical clustering using dynamic modeling
dist_matrix <- dist(data)  # Calculate the distance matrix
hc_model <- hclust(dist_matrix, method = "ward.D2")  # Apply hierarchical clustering with Ward linkage

# Plot the dendrogram to visualize the clustering
plot(hc_model, main = "Hierarchical Clustering Dendrogram", xlab = "Sample Data Points")

# Cut the dendrogram to get cluster labels
cluster_labels <- cutree(hc_model, k = 3)  # Specify the number of clusters (k) you want

# Print the cluster labels
print(cluster_labels)