setwd("C:/Users/admin/Desktop/data and scripts/figures6/")
data <- readxl::read_xlsx("figures6.xlsx")
library(ggplot2)
library(ggsignif)
library(reshape2)
data.melt = melt(data, value.name = "number")
data.melt$variable <- factor(data.melt$variable, levels = c("human", "pig", "chicken", "sheep/goat/bovine"))
ggplot(data.melt, aes(x = variable, y = number)) +
  geom_boxplot(aes(fill = variable)) +
  geom_point(aes(color = variable), size = 2, position = position_jitter(width = 0.2, height = 0)) + theme_bw()+
  theme(
    axis.text = element_text(size = 20),         # 设置坐标轴刻度标签字体大小
    axis.title = element_text(size = 20)         # 设置坐标轴标题字体大小
  )+
  geom_signif(
    comparisons = list(c("pig", "sheep/goat/bovine")),
    map_signif_level = TRUE,
    tip_length = c(0, 0, 0, 0),
    y_position = c(7, 7),
    size = 0.8,
    textsize = 6,
    test = "wilcox.test"
  )+
  geom_signif(
    comparisons = list(c("pig", "human")),
    map_signif_level = TRUE,
    tip_length = c(0, 0, 0, 0),
    y_position = c(8, 8),
    size = 0.8,
    textsize = 6,
    test = "wilcox.test"
  )+
  geom_signif(
    comparisons = list(c("pig", "chicken")),
    map_signif_level = TRUE,
    tip_length = c(0, 0, 0, 0),
    y_position = c(9, 9),
    size = 0.8,
    textsize = 6,
    test = "wilcox.test"
  )
