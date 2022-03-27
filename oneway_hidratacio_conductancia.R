
data <- read.csv("hidratacio_conductancia.csv", header = TRUE, colClasses = c("factor", "factor", "numeric", "numeric"))
colnames(data) <- c('condicio','cara','conductancia','hidratacio')

# hidratacio

hidratacio <- data["hidratacio"]
condicio <- data["condicio"]
one.way <- aov(hidratacio ~ condicio, data = data)
summary(one.way)


# conductancia

conductancia <- data["hidratacio"]
one.way <- aov(conductancia ~ condicio, data = data)
summary(one.way)