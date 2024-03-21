library(cluster)
library(tidyverse)
library(factoextra)
library(carData)
df <- read.csv("C:/Users/ShyamVenkatraman/Pictures/data.csv")
data <- df[, c("Latitude", "Longtude")]
clara_result <- clara(data, k = 2)
optimal_clusters <- fviz_nbclust(data, FUNcluster = clara, method = "wss")  
print(optimal_clusters)
clara.res <- clara(df, 2, metric = "euclidean", stand = TRUE, correct.d = FALSE)
print(clara.res)
dd = data.frame(df,clara.res$cluster)
dd
view(dd)
constant_columns <- sapply(df, function(x) length(unique(x)) <= 1)
df_filtered <- df[, !constant_columns]
clara_res_filtered <- clara(df_filtered, k = 2)
fviz_cluster(clara_res_filtered, data = df_filtered)
