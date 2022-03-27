# densitat

crop.data <- read.csv("anova_densitat.csv", header = TRUE, colClasses = c("factor", "factor", "numeric"))
colnames(crop.data) <- c('condicio','cara','densitat')

crop.data.control <- crop.data[crop.data$condicio == '1',]
crop.data.estres <- crop.data[crop.data$condicio == '2',]

densitat <- crop.data.control["densitat"]
cara <- crop.data.control["cara"]
condicio <- crop.data.control["condicio"]
one.way <- aov(densitat ~ cara, data = crop.data.control)
summary(one.way)

densitat <- crop.data.estres["densitat"]
cara <- crop.data.estres["cara"]
condicio <- crop.data.estres["condicio"]
one.way <- aov(densitat ~ cara, data = crop.data.estres)
summary(one.way)

# conductancia
crop.data <- read.csv("anova_conductancia.csv", header = TRUE, colClasses = c("factor", "factor", "numeric"))
colnames(crop.data) <- c('condicio','cara','conductancia')

crop.data.control <- crop.data[crop.data$condicio == '1',]
crop.data.estres <- crop.data[crop.data$condicio == '2',]

conductancia <- crop.data.control["conductancia"]
cara <- crop.data.control["cara"]
one.way <- aov(conductancia ~ cara, data = crop.data.control)
summary(one.way)

conductancia <- crop.data.estres["conductancia"]
cara <- crop.data.estres["cara"]
one.way <- aov(conductancia ~ cara, data = crop.data.estres)
summary(one.way)