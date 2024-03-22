library(tidyverse)
library(cluster)
library(factoextra)
library(dendextend)

# Load the dataset
df <- read.csv("C:/Users/ShyamVenkatraman/Pictures/data.csv")

# Select numerical attributes for clustering
selected_attributes <- c("Latitude", "Longtude")

# Subset the dataset to include only the selected attributes
df_selected <- df[selected_attributes]

# Remove rows with missing values
df_selected <- na.omit(df_selected)

# Standardize the dataset
df_selected <- scale(df_selected)

# Check the size of the dataset
if (nrow(df_selected) < 2) {
  stop("At least 2 objects are required for clustering.")
}

# Perform hierarchical clustering
dis <- dist(df_selected, method = "euclidean")
hc <- hclust(dis, method = "complete")
plot(hc, cex = 0.6, hang = -1)

# Perform agglomerative hierarchical clustering
h <- agnes(df_selected, method = "complete")
h$ac
