### uniref90 screen


library(tidyverse)


### read in ----
in_path <- "C:/Users/mckyf/OneDrive - Northwestern University/Project folders/Calumet metagenomics/Results from quest/diamond_contigs/uniref90_denit.tsv"
ref_path <- "C:/Users/mckyf/OneDrive - Northwestern University/Project folders/Metagenomic reference files/uniref90_denit.tsv"

df <- read_delim(file.path(in_path), col_names = c("qseqid", "sseqid", "pident", "length", "mismatch", "gapopen", 
                                                   "qstart", "qend", "sstart", "send", "evalue", "bitscore"))
df <- df %>% 
  mutate(contig = str_extract(qseqid, "k[0-9]+_[0-9]+"))

ref <- read_delim(file.path(ref_path)) %>%
  select(c("Cluster ID", "Organisms", "Common taxon"))

colnames(ref) <- c("sseqid", "organisms", "common_organism")

rpkm_path <- "C:/Users/mckyf/OneDrive - Northwestern University/Project folders/Calumet metagenomics/Results from quest/pileup/CAL1/CAL1.rpkm.txt"

rpkm <- read_delim(file.path(rpkm_path), col_names = c("contig", "length", "bases", "coverage", "reads", "rpkm", "frags", "fpkm"), comment = "#") %>%
  select(c(contig, rpkm))

df <- df %>%
  left_join(rpkm, by = "contig")

df_sum <- df %>%
  left_join(ref, by = "sseqid") %>%
  group_by(common_organism) %>%
  summarise(rpkm_tot = sum(rpkm))

