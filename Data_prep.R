### Global
library(readxl)

### Experiments ----------------------------------------------------------------
df_exp <- read_xlsx("Input/Exp_OM.xlsx")
df_exp <- df_exp[-c(1:3),]

## Remover records where animals haven't survived until the end of the experiment but also drop the non-mixed for Forni (experiment fail before end)
df_exp <- subset(df_exp, is.na(df_exp$Remove) == TRUE)[,-12]

## Split the dfs
df_exp_FOR <- subset(df_exp, Glacier == "FOR") 
df_exp_STE <- subset(df_exp, Glacier == "EBE")
df_exp_LYR <- subset(df_exp, Glacier == "LYR")


### Field ----------------------------------------------------------------------

### LYR
## Import
df_LYR <- read_xlsx("Input/LYR_21_oxygen.xlsx")
df_LYR <- df_LYR[,]

### FOR
## Import
df_FOR <- read_xlsx("Input/FOR_21_oxygen.xlsx")
df_FOR$krio_ID <- as.factor(df_FOR$krio_ID)

df_FOR$Animal_count <- df_FOR$deformed_specimens + df_FOR$accurate_specimens
