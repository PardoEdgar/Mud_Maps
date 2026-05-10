library(tidyverse)
library(ggrepel)
Colonies_data <- read.csv(
  "C:/Users/jandr/Downloads/Metashape_Work/Colonies_data_csv_Saboga_0to25.csv"
)
Colonies_data <- Colonies_data[!duplicated(Colonies_data$Colony_ID), ] |>
  dplyr::filter(!Colony_ID %in% c(716, 717, 918))

Colonies_data$type <- ifelse(
  grepl("[A-Z]", Colonies_data$Colony_ID),
  "Polls",
  "Colonies"
)


subset_words <- (Colonies_data[Colonies_data$type == "Polls", ])
subset_words <- subset_words[order(subset_words$Colony_ID), ]
subset_numbers <- (Colonies_data[Colonies_data$type == "Colonies", ])

ggplot(
  Colonies_data,
  aes(
    x = Colonies_data$X_Real_World_Position,
    y = Colonies_data$Y_Real_World_Position,
  )
) +
  scale_color_manual(values = c("darkred", "darkblue")) +
  scale_shape_manual(values = c(18, 16)) +
  geom_path(
    data = subset_words,
    aes(
      x = subset_words$X_Real_World_Position,
      y = subset_words$Y_Real_World_Position
    ),
    color = "darkblue"
  ) +
  geom_point(aes(color = type, shape = type), size = 7, alpha = 1) +
  coord_fixed() +
  labs(title = "Mud map of colonies in Saboga", subtitle = "0-25 m") +
  xlab("X (meters)") +
  ylab("Y (meters)") +
  ylim(
    min(Colonies_data$Y_Real_World_Position) - 1,
    max(Colonies_data$Y_Real_World_Position) + 2
  ) +
  xlim(
    min(Colonies_data$X_Real_World_Position) - 1,
    max(Colonies_data$X_Real_World_Position) + 2
  ) +
  geom_text_repel(aes(label = Colony_ID), size = 5, vjust = -1, hjust = -0.8) +
  theme_classic() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 20),
    legend.position = "top",
  )
