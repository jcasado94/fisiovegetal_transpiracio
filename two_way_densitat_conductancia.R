#conductancia

crop.data <- read.csv("anova_conductancia.csv", header = TRUE, colClasses = c("factor", "factor", "numeric"))
colnames(crop.data) <- c('condicio','cara','conductancia')
conductancia <- crop.data["conductancia"]
cara <- crop.data["cara"]
condicio <- crop.data["condicio"]

two.way <- aov(conductancia ~ condicio + cara, data = crop.data)
summary(two.way)
interaction <- aov(conductancia ~ condicio * cara, data = crop.data)

library(AICcmodavg)
model.set <- list(two.way, interaction)
model.names <- c("two.way", "interaction")

aictab(model.set, modnames = model.names)

TukeyHSD(two.way)


# densitat
crop.data <- read.csv("anova_densitat.csv", header = TRUE, colClasses = c("factor", "factor", "numeric"))
colnames(crop.data) <- c('condicio','cara','densitat')
densitat <- crop.data["densitat"]
cara <- crop.data["cara"]
condicio <- crop.data["condicio"]

two.way <- aov(densitat ~ condicio + cara, data = crop.data)
interaction <- aov(densitat ~ condicio * cara, data = crop.data)

library(AICcmodavg)
model.set <- list(two.way, interaction)
model.names <- c("two.way", "interaction")

aictab(model.set, modnames = model.names)
summary(two.way)

TukeyHSD(two.way)
