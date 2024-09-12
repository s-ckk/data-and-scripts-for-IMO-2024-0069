setwd("C:/Users/admin/Desktop/data and scripts/figures4//")
data <- read.delim("figures4.txt", row.names = 1, sep = '\t', stringsAsFactors = FALSE, check.names = FALSE)
library(vegan)

bray_dis <- vegdist(data, method = 'bray')
nmds_dis <- metaMDS(bray_dis, k = 2)
nmds_dis_species <- wascores(nmds_dis$points, data)

library(ggplot2)
nmds_data <- scores(nmds_dis)
nmds_dis <- as.data.frame(nmds_data)

nmds_dis$name <- rownames(nmds_dis)
map<-read.table("zhushi.txt",header=T,sep="\t",row.names=1)
merged=merge(nmds_dis,map,by="row.names",all.x=TRUE)

custom_colors <- c("#1f77b4", "#ff7f0e", "#2ca02c", "#d62728", "#9467bd", "black", "blue")

ggplot(data = merged, aes(NMDS1, NMDS2)) +
  geom_point(size = 2, aes(color = factor(location), shape = factor(location))) +
  stat_ellipse(aes(fill = factor(location)), geom = 'polygon', level = 0.95, alpha = 0.1, show.legend = FALSE) +
  scale_color_manual(values = custom_colors) +  
  scale_fill_manual(values = custom_colors) +  
  scale_shape_manual(values = c(16, 16, 16, 16, 16, 16, 16)) + 
  theme(panel.grid.major = element_line(color = 'gray', size = 0.2),
        panel.background = element_rect(color = 'black', fill = 'transparent'), 
        plot.title = element_text(hjust = 0.5),
        legend.title = element_blank()) +
  geom_vline(xintercept = 0, color = 'gray', size = 0.5) +
  geom_hline(yintercept = 0, color = 'gray', size = 0.5) +
  geom_text(data = merged, aes(label = Row.names, x = NMDS1, y = NMDS2), alpha = 0, check_overlap = TRUE)    

