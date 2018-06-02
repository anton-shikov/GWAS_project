library(qqman)
library(dplyr)
library(ggplot2)
manhattan_file = read.csv('Clustered_mahattan_09.tsv', header = FALSE, sep = "\t") %>% mutate(V5=as.numeric(V5))
str(manhattan_file)

#manhattan(manhattan_file, chr="V1", bp="V2", snp="V3", p="V5", logp = FALSE)
colnames(manhattan_file) = c('CHR', "BP", "SNP", "Assos_list", "Assos_num")

don <- manhattan_file %>% 
  group_by(CHR) %>% 
  summarise(chr_len=max(BP)) %>% 
  mutate(tot=cumsum(chr_len)-chr_len) %>%
  select(-chr_len) %>%
  left_join(manhattan_file, ., by=c("CHR"="CHR")) %>%
  arrange(CHR, BP) %>%
  mutate( BPcum=BP+tot)
axisdf = don %>% group_by(CHR) %>% summarize(center=( max(BPcum) + min(BPcum) ) / 2 )

ggplot(don, aes(x=BPcum, y=Assos_num)) +
  geom_point( aes(color=as.factor(CHR)), alpha=0.9, size=1.3) +
  scale_color_manual(values = rep(c("blue","yellow", "green", "grey", "skyblue", "purple","black","orange", "red", "cyan", "pink"), 2 )) +
  scale_x_continuous(label = axisdf$CHR, breaks= axisdf$center ) +
  scale_y_continuous(expand = c(0, 0) ) +     
  xlab('Genomic coordinate') + ylab('Number of associated clusters')+
  theme_bw() +
  theme( 
    legend.position="none",
    panel.border = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()
  )
