coefficient_file = read.csv('Clust_MAF_file_09.tsv', header = FALSE, sep = "\t")
colnames(coefficient_file) = c('rsid','MAF','Num_of_associations')
library("ggpubr")
ggscatter(coefficient_file, x = "MAF", y = "Num_of_associations", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "MAF", ylab = "Number of assiciated clusters")
str(coefficient_file)
coefficient_file$MAF <- ifelse(coefficient_file$MAF<0.5, coefficient_file$MAF, coefficient_file$MAF-0.5)
res <- cor.test(coefficient_file$Num_of_associations, coefficient_file$MAF, method = "pearson")
res$estimate
coefficient_file$fac <- as.factor(ifelse(coefficient_file$Num_of_associations<10, "<10", ">=10"))
ggplot(coefficient_file, aes(x=fac, y=MAF, fill=fac)) + 
  geom_violin(scale = "area", trim = FALSE, adjust=115)+
  xlab('Number of associated clusters') + 
  ylab('MAF')+ 
  guides(fill=guide_legend(title="Number of associated clusters"))

coefficient_file_2 <- coefficient_file[coefficient_file$Num_of_associations<8,]
res2 <- cor.test(coefficient_file_2$Num_of_associations, coefficient_file_2$MAF, method = "pearson")
res2$estimate

wilcox.test(MAF ~ fac, data=coefficient_file) 