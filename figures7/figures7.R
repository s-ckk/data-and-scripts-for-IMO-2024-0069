setwd("C:/Users/admin/Desktop/data and scripts/figures7/")
data <- read.table("figures7.txt", header = TRUE, row.names = 1)
library(ggplot2)
library(pheatmap)
data <- as.matrix(data)
write.table(data, "data.tab", sep="\t", quote=FALSE)
data <- read.table("data.tab")
zhushi<-read.table("figures7zhushi.txt",header=T,sep="\t",row.names=1)
annotation_row <- as.data.frame(zhushi) 
ann_colors = list(cluster = c(cluster1 = "#30655f", cluster2 = "#8f9a7a", cluster3 = "#5ba585", cluster4 = "#c19264", cluster5 = "#ca5862", cluster6 = "#e9e9e4"))
p1 <- pheatmap(data, annotation_row = annotation_row, 
         cluster_rows = TRUE,
         cluster_cols = TRUE,
         show_colnames = FALSE, show_rownames = FALSE, cellwidth = 0.01, cellheight = 0.5, color = colorRampPalette(c("white", "black"))(100), annotation_colors = ann_colors)
zhushi2<-read.table("figures7zhushi2.txt",header=T,sep="\t",row.names=1)
annotation_row1 <- as.data.frame(zhushi) 
bnn_colors = list(source = c(human = "#30655f", pig = "#8f9a7a", chicken = "#5ba585", sheep/goat/bovine = "#c19264"))
p1 <- pheatmap(data, annotation_row = annotation_row1, 
               cluster_rows = TRUE,
               cluster_cols = TRUE,
               show_colnames = FALSE, show_rownames = FALSE, cellwidth = 0.01, cellheight = 0.5, color = colorRampPalette(c("white", "black"))(100), annotation_colors = bnn_colors)