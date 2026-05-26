# Spatial Mapping of Tagged Coral Colonies in (Rohr Reef Resilience project, Connolly Lab, 2026
## Smithsonian Tropical Research Institute (STRI)

------

## Overview
This repository provides a reproducible workflow for Spatial Mapping from 3D models and Orthomosacs built in Agisoft Metashape
The approach combines Python and R scrips using Metashape-API to extract internal locations and convert them to Real World position with transformation matrix.
Then, we plotted the Tagged Coral and Poles locations and further edited the maps with Inkscape for better aesthetic visualization.
Here we also acquired new possible tagged coral colonies using de Orthomosaics as a map and plotted their locations for further searching in field.

---
## Contents
- `data/`: Raw and processed datasets  
- `scripts/`: R scripts for data extraction and analysis  
- `imagej/`: ImageJ macros for pixel intensity extraction and stripe detection  
- `Figures/`: Optocardiograms and Experimental setup images for Optocardiography

---
## Reproducibility
All scripts conducted in Python and R are provided in sequential order:
 1. `01_heart_pixel_data_obtention.py`
 2. `02_heart_pixel_data_obtention.py`
 3. `03_heart_pixel_data_obtention.py`
 4. `04_heart_pixel_data_obtention.py`
 5. `05_heart_pixel_data_obtention.R`
 6. `06_heart_pixel_data_obtention.R`
    
---------------
## Requirements
### Python
  - API metashape
  - NumPY
  - Os
  - Pandas
### R 
  - tidyverse  
  - ggrepel

-------
## Data availability
All data and code required to reproduce the Spatial Mapping presented here are included in this repository.

------------
## Author
Edgar Alejandro Pardo Sarmiento, Connolly Lab

### Collaborators
Mariana Fernández, Connolly Lab

--------
## License
The source code in this repository is licensed under the MIT License.
All data and figures are licensed under the Creative Commons Attribution 4.0 International License (CC BY 4.0).
