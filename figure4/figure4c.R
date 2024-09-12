setwd("C:/Users/admin/Desktop/data and scripts/figure4/")
data <- readxl::read_xlsx("figure4c.xlsx")
library(ggplot2)
library(ggsignif)
library(reshape2)
data.melt = melt(data, value.name = "number")
data.melt$variable <- factor(data.melt$variable, levels = c("human", "pig", "chicken", "sheep/goat/bovine"))
ggplot(data.melt, aes(x = variable, y = number)) +
  geom_boxplot()+
  geom_violin(aes(fill = variable)) +
  theme_bw()+
  theme(
    axis.text = element_text(size = 20),         # 设置坐标轴刻度标签字体大小
    axis.title = element_text(size = 20)         # 设置坐标轴标题字体大小
  )+
  geom_signif(
    comparisons = list(c("human", "pig")),
    map_signif_level = TRUE,
    tip_length = c(0, 0, 0, 0),
    y_position = c(12, 12),
    size = 0.8,
    textsize = 6,
    test = "wilcox.test"
  )+
  geom_signif(
    comparisons = list(c("human", "chicken")),
    map_signif_level = TRUE,
    tip_length = c(0, 0, 0, 0),
    y_position = c(13, 13),
    size = 0.8,
    textsize = 6,
    test = "wilcox.test"
  )+
  geom_signif(
    comparisons = list(c("human", "sheep/goat/bovine")),
    map_signif_level = TRUE,
    tip_length = c(0, 0, 0, 0),
    y_position = c(14, 14),
    size = 0.8,
    textsize = 6,
    test = "wilcox.test"
  )

