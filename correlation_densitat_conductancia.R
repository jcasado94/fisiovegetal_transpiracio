library("ggpubr")

correlacio_densitat_conductancia <- function(taula_densitat, taula_conductancia, title) {
  densitat <- taula_densitat["densitat"]
  conductancia <- taula_conductancia["conductancia"]
  conductancia_densitat <- data.frame(densitat, conductancia)
  
  ggscatter(conductancia_densitat, x = "densitat", y = "conductancia", 
            add = "reg.line", conf.int = FALSE, 
            cor.coef = TRUE, cor.method = "pearson",
            xlab = "Densitat", ylab = "Conductancia", title = title,
            cor.coef.size = 7)+
    font("ylab", size = 20)+
    font("xlab", size = 20)
  
}

conductancia.data <- read.csv("conductancia_trimmed.csv", header = TRUE, colClasses = c("factor", "factor", "numeric"))
colnames(conductancia.data) <- c('condicio','cara','conductancia')

densitat.data <- read.csv("densitat_trimmed.csv", header = TRUE, colClasses = c("factor", "factor", "numeric"))
colnames(densitat.data) <- c('condicio','cara','densitat')


# densitat-conductancia control
correlacio_densitat_conductancia(densitat.data[densitat.data$condicio == "1",],
                                 conductancia.data[conductancia.data$condicio == "1",], "control")

# densitat-conductancia estres
correlacio_densitat_conductancia(densitat.data[densitat.data$condicio == "2",],
                                 conductancia.data[conductancia.data$condicio == "2",], "estres")

# densitat-conductancia global
correlacio_densitat_conductancia(densitat.data,
                                 conductancia.data, "control+estres")