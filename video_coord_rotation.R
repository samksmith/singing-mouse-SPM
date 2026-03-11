library(tidyverse)
library(dplyr)

# read in csv file from deeplabcut network output
vid_coord <- read_csv("/PATH/TO/FILE/STred5_006_rotatedDLC_resnet50_STRed5#006Oct3shuffle1_250000.csv")
#rename columns
colnames(vid_coord) <- paste0(vid_coord[1,],"_",vid_coord[2,])
# remove unneeded rows and columns
vid_coord <- vid_coord[-c(1:2),-c(1)]
head(vid_coord)

# write out file (doing actual rotation in matlab with "rotate_image_coordinates.m")
write_csv(vid_coord,"PATH/TO/FILE/STRed5_006_DLC_headerfixed.csv")
