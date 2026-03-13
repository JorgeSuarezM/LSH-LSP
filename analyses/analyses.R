setwd("~/Library/CloudStorage/GoogleDrive-suarezmjorge@gmail.com/Otros ordenadores/Mi PC/PhD UGR/GitHub/LSH-LSP/analyses")
library(tidyverse)

# Load data
ls1 <- read_csv("lsh-lsp1.csv")
ls2 <- read_csv("lsh-lsp2.csv")
ls <- bind_rows(ls1, ls2)

# Filter
ls <- ls %>%
  filter(!is.na(ticket) & ticket != "")
