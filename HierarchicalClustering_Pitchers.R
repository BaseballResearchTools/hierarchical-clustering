#############################################
# Hierarchical Clustering                   #
# MLB Pitchers on Pitch Type Linear Weights #
#############################################


# read data
PitcherData = read.csv("PitcherData.csv")


# compute Euclidean distances
distances = dist(PitcherData[2:8], method = "euclidean")


# create clusters
clusterPitchers = hclust(distances, method = "ward.D")


# plot dendrogram
plot(clusterPitchers)


# define 15 clusters
clusterGroup = cutree(clusterPitchers, k = 12)


# combine original data with cluster group number
combined = data.frame(PitcherData, clusterGroup)


# write to csv
write.csv(combined, "PitcherClusters.csv")
