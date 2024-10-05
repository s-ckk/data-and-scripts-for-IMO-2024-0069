library(ggplot2)
library(pheatmap)
data <- readxl::read_xlsx("Figure S4A.xlsx")
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
pheatmap(data, annotation_row = annotation_row,
         cluster_rows = TRUE,
         cluster_cols = TRUE,
         show_colnames = FALSE, show_rownames = FALSE, cellwidth = 1, cellheight = 1, color = colorRampPalette(c("white", "black"))(100))
