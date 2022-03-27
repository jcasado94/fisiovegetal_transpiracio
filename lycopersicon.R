data <- read.csv("lycopersicon.csv", header = TRUE, colClasses = c("factor", "factor", "numeric"))
colnames(data) <- c('aba','cara','conductancia')

conductancia <- data['conductancia']
cara <- data['cara']
aba <- data['aba']

two.way <- aov(conductancia ~ aba + cara, data = data)
summary(two.way)
interaction <- aov(conductancia ~ aba * cara, data = data)

library(AICcmodavg)
model.set <- list(two.way, interaction)
model.names <- c("two.way", "interaction")

aictab(model.set, modnames = model.names)

TukeyHSD(two.way)

# one way conductancia-aba
one.way <- aov(conductancia ~ aba, data = data)
summary(one.way)

#one way per side

abaxial <- data[data$cara == '1',]
adaxial <- data[data$cara == '2',]

conductancia.abaxial <- unlist(abaxial['conductancia'])
aba.abaxial <- unlist(abaxial['aba'])
conductancia.adaxial <- unlist(adaxial['conductancia'])
aba.adaxial <- unlist(adaxial['aba'])

one.way <- aov(conductancia.abaxial ~ aba.abaxial, data = abaxial)
summary(one.way)
one.way <- aov(conductancia.adaxial ~ aba.adaxial, data = adaxial)
summary(one.way)