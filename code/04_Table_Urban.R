#LOAD DATA
library(readxl)
library(tidyverse)
library(dplyr)
library(labdsv)

data.all <- read_excel(path = "data/CarbonNumbers.xlsx", sheet = "CarbonNumbers", col_names = TRUE)
wetlands.all <- read_excel(path = "data/CarbonNumbers.xlsx", sheet = "Wetlands", col_names = TRUE)


# DATA CLEANING

#Red listed ecosystems 
PLOT.wetlands_RLNT <- wetlands.all %>% 
  filter(grepl('included', exl)) %>% 
  select(RLNT, StorageC_t.ha) %>% 
  drop_na()

wetlands_RLNT <- PLOT.wetlands_RLNT
  group_by(RLNT) %>% 
  summarise(mean = mean(StorageC_t.ha), sd = sd(StorageC_t.ha), min = min(StorageC_t.ha), max = max(StorageC_t.ha)) %>% 
  rename(Ecosystem2 = RLNT )

#Ecosystems
PLOT.wetlands <- wetlands.all %>% 
  filter(grepl('included', exl)) %>% 
  select(Ecosystem2, StorageC_t.ha) %>% 
  drop_na()

wetlands <- PLOT.wetlands
  group_by(Ecosystem2) %>% 
  summarise(mean = mean(StorageC_t.ha), sd = sd(StorageC_t.ha), min = min(StorageC_t.ha), max = max(StorageC_t.ha)) %>% 
  bind_rows(wetlands_RLNT)


wetlands <- wetlands.all %>% 
  filter(grepl('included', exl)) %>% 
  select(Ecosystem2, StorageC_t.ha) %>% 
  drop_na() %>% 
  group_by(Ecosystem2) %>% 
  summarise(mean = mean(StorageC_t.ha), sd = sd(StorageC_t.ha), min = min(StorageC_t.ha), max = max(StorageC_t.ha))

