library(circlize)
library(ggplot2)
data <- readr::read_tsv("figure1E.tsv")
sectors <- unique(c(data$from, data$to))
colors <- hcl.colors(length(sectors), "Set3")
grid_colors <- setNames(colors, sectors)
chordDiagram(
  x = data,
  grid.col = grid_colors,
  directional = 1,
  direction.type = c("arrows", "diffHeight"),
  diffHeight = -0.02,
  annotationTrack = c("name", "grid", "axis"),
  annotationTrackHeight = c(0.05, 0.08),
  link.arr.type = "big.arrow",
  link.sort = TRUE,
  link.largest.ontop = TRUE,
  transparency = 0.25)
