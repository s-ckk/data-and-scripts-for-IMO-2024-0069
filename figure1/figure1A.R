library(ggplot2)
library(pheatmap)
data <- readr::read_tsv("figure1A.tsv")
data <- as.matrix(data)
rownames(data) <- data[, 1]
data <- data[, -1]
n <- nrow(data)  # 获取矩阵的行数
n <- min(nrow(data), ncol(data))  # 获取矩阵的行数和列数中较小的一个
diag(data)[1:n] <- 100  # 将对角线元素替换为100

n <- nrow(data)  # 获取矩阵的行数
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
