library(ggplot2)
library(pheatmap)
data = readr::read_tsv("figure5c.tsv")
data <- as.matrix(data)
rownames(data) <- data[, 1]
data <- data[, -1]
write.table(data, "data.tab", sep="\t", quote=FALSE)
data <- read.table("data.tab")
pheatmap(data,
         cluster_rows = FALSE,
         cluster_cols = FALSE,
         show_colnames = FALSE, show_rownames = FALSE, cellwidth = 0.05, cellheight = 4, color = colorRampPalette(c("#ecf1f0", "#6e938f"))(100))
