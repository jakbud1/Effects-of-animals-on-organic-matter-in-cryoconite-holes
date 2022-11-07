### Global
source("Data_prep.R")

library(glmmTMB)
library(visreg)

### Experiments ----------------------------------------------------------------
## FOR
m0_exp_FOR <- glmmTMB(OM_diff_scaled ~ 1, 
                      data = df_exp_FOR); summary(m0_exp_FOR)
m1_exp_FOR <- glmmTMB(OM_diff_scaled ~ Anim_treatment, 
                      data = df_exp_FOR); summary(m1_exp_FOR)

plot(residuals(m1_exp_FOR), fitted(m1_exp_FOR))
qqnorm(residuals(m1_exp_FOR)); qqline(residuals(m1_exp_FOR))
visreg(m1_exp_FOR)

anova(m0_exp_FOR, m1_exp_FOR)

## STE
m0_exp_STE <- glmmTMB(OM_diff_scaled ~ 1, 
                      data = df_exp_STE); summary(m0_exp_STE)
m1_exp_STE <- glmmTMB(OM_diff_scaled ~ Anim_treatment * Mixing_treatment, 
                      data = df_exp_STE); summary(m1_exp_STE)

plot(residuals(m1_exp_STE), fitted(m1_exp_STE))
qqnorm(residuals(m1_exp_STE)); qqline(residuals(m1_exp_STE))
visreg(m1_exp_STE,"Anim_treatment", "Mixing_treatment")

anova(m0_exp_STE, m1_exp_STE)

## LYR
m0_exp_LYR <- glmmTMB(OM_diff_scaled ~ 1, 
                      data = df_exp_LYR); summary(m0_exp_LYR)
m1_exp_LYR <- glmmTMB(OM_diff_scaled ~ Anim_treatment * Mixing_treatment, 
                      data = df_exp_LYR); summary(m1_exp_LYR)

plot(residuals(m1_exp_LYR), fitted(m1_exp_LYR))
qqnorm(residuals(m1_exp_LYR)); qqline(residuals(m1_exp_LYR))
visreg(m1_exp_LYR, "Anim_treatment", "Mixing_treatment")

anova(m0_exp_LYR, m1_exp_LYR)

### Field ----------------------------------------------------------------------
## FOR
m0_field_FOR <- glmmTMB(OM ~ 1, 
                        data = df_FOR); summary(m0_field_FOR)
m1_field_FOR <- glmmTMB(OM ~ Animal_count + (1|krio_ID), 
                        data = df_FOR); summary(m1_field_FOR)

plot(residuals(m1_field_FOR), fitted(m1_field_FOR))
qqnorm(residuals(m1_field_FOR)); qqline(residuals(m1_field_FOR))
visreg(m1_field_FOR)

anova(m0_field_FOR, m1_field_FOR)

## LYR
m0_field_LYR <- glmmTMB(OM ~ 1, 
                        data = df_LYR); summary(m0_field_LYR)
m1_field_LYR <- glmmTMB(OM ~ ani_den * ani_type, 
                        data = df_LYR); summary(m1_field_LYR)

plot(residuals(m1_field_LYR), fitted(m1_field_LYR))
qqnorm(residuals(m1_field_LYR)); qqline(residuals(m1_field_LYR))
visreg(m1_field_LYR, "ani_den", "ani_type")

anova(m0_field_LYR, m1_field_LYR)
