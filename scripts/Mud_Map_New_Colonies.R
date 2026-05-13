theme_void() +
  theme(
    text = element_text(family = "Impact", size = 15),
    plot.title = element_text(hjust = 0.5, size = 23),
    legend.position = "top", panel.border = element_rect(
      color = "black",
      fill = NA,
      linewidth = 1) +
      annotate(
    "text",
    x = Inf,
    y = -Inf,
    label = "Connolly lab",
    hjust = 1.1,
    vjust = -0.8,
    family = "Impact",
    size = 4,
    fontface = "bold"
  )
#Export in pdf with 1500 width - 500 heigh to be modified in InkScape or AdobeIllustrator
#If having error saving plot, export using Rstudio or change font type and size from geom_text_repel and theme:text
