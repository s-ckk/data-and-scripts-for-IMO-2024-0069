library(ggplot2)
library(pheatmap)
data <- readr::read_tsv("Figure 1A.tsv")
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
pheatmap(data, 
         cluster_rows = TRUE,
         cluster_cols = TRUE,
         show_colnames = FALSE, show_rownames = FALSE, cellwidth = 2, cellheight = 2, color = colorRampPalette(c("white", "#31addb"))(100))
