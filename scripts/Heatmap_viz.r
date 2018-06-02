library(plotly)
library(cluster)
library(dplyr)
options(scipen = 999)
heatmap_file = read.csv('Sym_total_array_09.out', header = FALSE, sep = "\t") 
names_vec = as.vector(read.csv('names_for_map_09.csv', header = FALSE, sep = ","))
names_vec = as.vector(sapply(names_vec, as.character, simplify = TRUE))
colnames(heatmap_file) = names_vec
rownames(heatmap_file) = names_vec
heatmap_file = 1-heatmap_file
clusters <- hclust(as.dist(as.matrix(heatmap_file)), method = 'average')
plot(clusters)

clusterCut <- cutree(clusters, 1025)

s=NULL
for(i in 500:2200){
  k=cutree(clusters,i)
  s[i]=summary(silhouette(k,as.dist(heatmap_file)))$si.summary[3]
}
which.max(s)


names_frame <- data.frame(keyName=names(clusterCut), value=clusterCut, row.names=NULL) %>% arrange(value)

sorted_heatmap <- heatmap_file[as.vector(names_frame$keyName), as.vector(names_frame$keyName)]



write.table(names_frame, file = "For_clustering_09.tsv", quote=FALSE, sep='\t')

write.table(heatmap_file, file = "Ûíü_total_array_09.tsv", quote=FALSE, sep='\t')
heatmap_matrix = matrix(sorted_heatmap)
p <- plot_ly(z = heatmap_matrix, x = colnames(sorted_heatmap), y = rownames(sorted_heatmap), type = "heatmap",  reversescale =T)
htmlwidgets::saveWidget(as_widget(p), file = "Clustered_sym_heatmap_09.html")