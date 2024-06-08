### prokka parse

### packages ----
library(tidyverse)


### read in ----
pao_gao_gtdb <- readRDS("./intermediates/pao_gao_gtdb.RDS")
pao_gao_list <- as.vector(pao_gao_gtdb$user_genome)


in_path <- "C:/Users/mckyf/OneDrive - Northwestern University/Project folders/Calumet metagenomics/Results from quest/prokka"

Sys.glob(file.path(in_path, "/*/*/CAL2.11.tsv"))

test <- read_delim(file.path(in_path, ))
gtdb <- bind_rows(gtdb_raw)

