library(ggplot2)
library(pheatmap)
data <- read.table("Figure 1F.tab", header = TRUE, row.names = 1)
data <- as.matrix(data)
pheatmap(data, 
         cluster_rows = TRUE,
         cluster_cols = TRUE,
         show_colnames = FALSE, show_rownames = FALSE, cellwidth = 0.02, cellheight = 1, color = colorRampPalette(c("white", "#8693cf"))(100))
