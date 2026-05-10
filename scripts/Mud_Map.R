library(tidyverse)
library(ggrepel)

#Load data
path <- "C:/Users/jandr/Downloads/Metashape_Work/Colonies_data_csv_Saboga_0to25.csv"
Colonies_data <- read.csv(path)

#Remove colonies that are from the other transect part. Use: |>  dplyr::filter(!Colony_ID %in% c(716, 717, 918))
Colonies_data <- Colonies_data[!duplicated(Colonies_data$Colony_ID), ] |>
  dplyr::filter(!Colony_ID %in% c(716, 717, 918))

#Tag data depending of Poles or Colonies Type (Poles are Capital letter and Colonies are numbers)
Colonies_data$Type <- ifelse(
  grepl("[A-Z]", Colonies_data$Colony_ID),
  "Poles",
  "Colonies"
)

#Create subsets of data by Type (Colonies or letter)
subset_words <- (Colonies_data[Colonies_data$Type == "Poles", ])
subset_words <- subset_words[order(subset_words$Colony_ID), ]
subset_numbers <- (Colonies_data[Colonies_data$Type == "Colonies", ])


#Build the map
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
  geom_point(aes(color = Type, shape = Type), size = 7, alpha = 1) +
  #Fixed x and y axis to get relative location.
  coord_fixed() +
  labs(title = "Mud map of colonies in Saboga", subtitle = "0-25 m") +
  xlab("X (meters)") +
  ylab("Y (meters)") +
  # Stablish X and Y limits
  # Add +- 1 or 2 to include colonies near the axis
  ylim(
    min(Colonies_data$Y_Real_World_Position) - 1,
    max(Colonies_data$Y_Real_World_Position) + 2
  ) +
  xlim(
    min(Colonies_data$X_Real_World_Position) - 1,
    max(Colonies_data$X_Real_World_Position) + 2
  ) +
  #Label Colonies and Poles IDs and modify vertical and horizontal justifation depending on the map
  geom_text_repel(aes(label = Colony_ID), size = 5, vjust = -1.2, hjust = 0.3) +
  #Remove axes traces
  theme_void() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 20),
    legend.position = "top",
  )
#Export in pdf with 1500 width - 500 heigh to be modified in InkScape or AdobeIllustrator
