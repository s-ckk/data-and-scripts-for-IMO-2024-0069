library(ggplot2)
library(pheatmap)
data = readr::read_tsv("Figure 5C2.tsv")
data <- as.matrix(data)
rownames(data) <- data[, 1]
data <- data[, -1]
n <- nrow(data)  
n <- min(nrow(data), ncol(data))  
diag(data)[1:n] <- 100  

n <- nrow(data) 
for (i in 1:n) {
  for (j in 1:n) {
    if (is.na(data[i, j]) && i < j) {
      data[i, j] <- data[j, i]
    }
  }
}
write.table(data, "data.tab", sep="\t", quote=FALSE)
data <- read.table("data.tab")

zhushi<-read.table("zhushi.txt",header=T,sep="\t",row.names=1)
annotation_row <- as.data.frame(zhushi)
annotation_col <- 
ann_colors = list(country = c(China = "#c83d3d", USA = "#2840a1", Finland = "#a855da", UK= "#d1762f", Australia = "#2aa570", Italy = "#020304"))
pheatmap(data,annotation_row = annotation_row, annotation_col = annotation_row, annotation_colors = ann_colors,
         cluster_rows = TRUE,
         cluster_cols = TRUE,
         show_colnames = FALSE, show_rownames = FALSE, cellwidth = 4, cellheight = 4, color = colorRampPalette(c("#ecf1f0", "#6e938f"))(100))
