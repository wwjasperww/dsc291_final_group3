install.packages("CMplot")
library(CMplot)
library(data.table)
library(tidyverse)

data <- fread("HP.sex.combined.GWAS.tsv.gz")

data_trimmed <-  data[which(data$p_value < 0.03), c("rs_id", "chromosome","base_pair_location", "p_value")]
colnames(data_trimmed) <- c("SNP", "Chromosome", "Position", "HP_Deangelis")

rm(data)
gc()

library(dplyr)
data_trimmed1 <- data_trimmed %>%
  arrange(Chromosome, Position) %>%
  mutate(Spike = cumsum(c(0, diff(Position)) > 400000)) # Adjust threshold as needed

# Find the top SNP (lowest p-value) per spike
top_per_spike <- data_trimmed1 %>%
  group_by(Spike) %>%
  slice_min(order_by = HP_Deangelis, n = 1) %>%
  ungroup()

# Extract top rsid per spike
top_rsid <- top_per_spike$SNP[which(top_per_spike$HP_Deangelis < 0.05e-08)]

intersect(data_trimmed$SNP, top_rsid)

# Generate circle MH using CMplot
CMplot(data_trimmed, type="p", plot.type="c", 
       chr.labels=paste("Chr",c(1:22), sep=""), 
       cir.axis=T, cir.axis.grid = T, outward=T, 
       multraits = F, cir.axis.col="lightgrey", cir.chr.h=0.8, chr.den.col="lightgrey", 
       file="jpg", file.name="", dpi=450, file.output=TRUE, 
       verbose=T, width=10, height=10, LOG10 = T, 
       amplify = F, chr.border = T,  col=c("#0516C7", "#1839F7"), 
       cex = 0.5, pch = 5.5, r = 1.5, cir.band = 0.9, band = 0.5, 
       lab.cex = 1.25, threshold=5E-08, threshold.col="#F13300", 
       #highlight.col = "darkred", # signal.col = NULL,
       threshold.lwd=1.3, threshold.lty=2, signal.line = T,
       highlight = top_rsid,
       highlight.text = top_rsid,
       highlight.text.cex = 1.5,
       highlight.text.col = "black")
#highlight = top_rsid, highlight.text = top_rsid)


#write.table(data_trimmed[which(data_trimmed$SNP %in% top_rsid), ], "topSNPs_selectSpikes.table", quote = F, row.names = F)