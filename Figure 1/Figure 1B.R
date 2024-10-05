library(ComplexHeatmap)
library(circlize)
dt <- readr::read_tsv("Figure 1B.tsv")
dt <- dt[ ,-1]
dt <- as.matrix(dt)
col_sums <- colSums(dt)
sorted_cols <- order(col_sums, decreasing = TRUE)
dt <- dt[, sorted_cols]
col_fun = colorRamp2(c(0,1), c("#ffffff", "#8693cf"))
#准备条形图注释文件；
range(colSums(dt))
bar1 <- HeatmapAnnotation(
  sum1 = anno_barplot(
    colSums(dt),
    bar_width = 0.9,
    gp = gpar(col = "#ffffff", fill = "#8693cf"),
    border = F,
    axis_param = list(at = c(0,1.25e5,2.5e5),
                      labels = c("0","125k","250k")),
    height = unit(2, "cm")), show_annotation_name = F)

Heatmap(dt, col = col_fun,width = unit(5, "cm"),name = "gene",
        cluster_columns = FALSE,
        cluster_rows = FALSE,
        show_row_dend = FALSE,
        show_row_names = FALSE,
        top_annotation =bar1,
        row_names_side = "left",
        row_names_gp = gpar(fontsize = 8),
        column_names_gp = gpar(fontsize = 8))
