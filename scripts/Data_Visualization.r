library(ggplot2)
file = read.csv('Manhattan_09.tsv', header = FALSE, sep = "\t")
file2 <- read.csv('Clustered_mahattan_09.tsv', header = FALSE, sep = "\t")
colnames(file)[2] <- c("number_of_associations")
colnames(file2)[2] <- c("number_of_associations")

ggplot(file, aes(number_of_associations)) +
  geom_density(adjust = 15, alpha = 0.3, fill = 'blue')+
  labs(x = "Number of SNP associations")

ggplot(file, aes(number_of_associations)) +
  geom_point(alpha = 0.6, col = 'blue', stat = "count")+
  labs(x = "Number of SNP associations", y = "Occurrence frequency")

ggplot(file,aes(number_of_associations)) + 
  geom_histogram(data = file2[file2$number_of_associations>10,], fill = "red", alpha = 0.5,stat = "count") + 
  geom_histogram(data = file[file$number_of_associations>10,], fill = "blue", alpha = 0.3,stat = "count")+ 
  labs(x = "Number of associated phenotypes/clusters", y = "Occurrence frequency") 



ggplot(file2, aes(number_of_associations)) +
  geom_density(adjust = 15, alpha = 0.3, fill = 'blue')+
  labs(x = "Number of associated clusters")



ggplot(file2, aes(number_of_associations)) +
  geom_point(alpha = 0.6, col = 'blue', stat = "count")+
  labs(x = "Number of associated clusters", y = "Occurrence frequency")
