######################################################
###         Probit Analysis
######################################################

# first probit model
initial_probit <- glm(IPV ~ AGE +  MILITARY + EMPLOYED_AT_TIME + WHITE + SPOUSE_PRESENT + BELOW_HS + HS + HIGHER_ED + 
                        HIGH_INCOME + LOW_INCOME + CHILDREN, family=binomial(link="probit"), data = allYears)
summary(initial_probit)
# marginal effects
install.packages("mfx")
library(mfx)
probitmfx(IPV ~ AGE +  MILITARY + EMPLOYED_AT_TIME + WHITE + SPOUSE_PRESENT + BELOW_HS + HS + HIGHER_ED + 
            HIGH_INCOME + LOW_INCOME + CHILDREN, data = allYears, atmean = FALSE)

# goodness-of-fit
logLik(initial_probit) # log likelihood
with(initial_probit, null.deviance - deviance) # chisq df 
with(initial_probit, pchisq(null.deviance - deviance, df.null - df.residual, lower.tail = FALSE)) #chisq p

#install.packages("plotrix")
#library(plotrix)

womensData <- allYears[allYears$GENDER == 2,]
labels <- c("Reported no IPV", "Reported IPV")
colors <- c("darkslategray2", "darkolivegreen1")
w_IPV_freq = table(womensData$IPV)
#pie3D(w_IPV_freq, labels = labels, main = "Percentage of Women Reporting IPV", col = colors)

mensData <- allYears[allYears$GENDER == 1,]
m_IPV_freq = table(mensData$IPV)
#pie3D(m_IPV_freq, labels = labels, main = "Percentage of Men Reporting IPV", col = colors)

# gender-specific probits
men_probit <- glm(IPV ~ AGE +  MILITARY + EMPLOYED_AT_TIME + WHITE + SPOUSE_PRESENT + BELOW_HS + HS + HIGHER_ED + 
                    HIGH_INCOME + LOW_INCOME + CHILDREN, family=binomial(link="probit"), data = mensData)
women_probit <- glm(IPV ~ AGE +  MILITARY + EMPLOYED_AT_TIME + WHITE + SPOUSE_PRESENT + BELOW_HS + HS + HIGHER_ED + 
                      HIGH_INCOME + LOW_INCOME + CHILDREN, family=binomial(link="probit"), data = womensData)
summary(men_probit)
# marginal effects
probitmfx(IPV ~ AGE +  MILITARY + EMPLOYED_AT_TIME + WHITE + SPOUSE_PRESENT + BELOW_HS + HS + HIGHER_ED + 
            HIGH_INCOME + LOW_INCOME + CHILDREN, data = mensData, atmean = FALSE)
# goodness-of-fit
logLik(men_probit)
with(men_probit, null.deviance - deviance)
with(men_probit, pchisq(null.deviance - deviance, df.null - df.residual, lower.tail = FALSE))

summary(women_probit)
# marginal effects
probitmfx(IPV ~ AGE +  MILITARY + EMPLOYED_AT_TIME + WHITE + SPOUSE_PRESENT + BELOW_HS + HS + HIGHER_ED + 
            HIGH_INCOME + LOW_INCOME + CHILDREN, data = womensData, atmean = FALSE)
# goodness-of-fit
logLik(women_probit)
with(women_probit, null.deviance - deviance)
with(women_probit, pchisq(null.deviance - deviance, df.null - df.residual, lower.tail = FALSE))