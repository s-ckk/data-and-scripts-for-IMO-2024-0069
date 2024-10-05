library(ggplot2)
library(pheatmap)
data <- read.table("Figure 2A.tab", header = TRUE, row.names = 1)
data <- as.matrix(data)
pheatmap(data, 
         cluster_rows = FALSE,
         cluster_cols = FALSE,
         show_colnames = FALSE, show_rownames = FALSE, cellwidth = 0.1, cellheight = 8, color = colorRampPalette(c("white", "#8693cf"))(100))
