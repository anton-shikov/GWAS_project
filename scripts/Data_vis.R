library(ggplot2)
file = read.csv('all_merged_sorted.tsv', header = FALSE, sep = "\t")
colnames(file)[11] <- c("number_of_associations")
ggplot(file, aes(number_of_associations)) +
  geom_density(adjust = 15, alpha = 0.3, fill = 'blue')+
  labs(x = "Number of SNP associations")

ggplot(file, aes(number_of_associations)) +
  geom_point(alpha = 0.6, col = 'blue', stat = "count")+
  labs(x = "Number of SNP associations", y = "Occurrence frequency")
