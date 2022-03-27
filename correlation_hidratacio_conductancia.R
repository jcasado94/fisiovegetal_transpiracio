
correlacio_hidratacio_conductancia <- function(hidratacio, conductancia, title) {
  hidratacio_conductancia <- data.frame(hidratacio, conductancia)
  
  ggscatter(hidratacio_conductancia, x = "hidratacio", y = "conductancia", 
            add = "reg.line", conf.int = FALSE, 
            cor.coef = TRUE, cor.method = "pearson",
            xlab = "Hidratació", ylab = "Conductància", title = title,
            cor.coef.size = 7)+
    font("ylab", size = 20)+
    font("xlab", size = 20)
  
}

data <- read.csv("hidratacio_conductancia.csv", header = TRUE, colClasses = c("factor", "factor", "numeric", "numeric"))
colnames(data) <- c('condicio','cara','conductancia','hidratacio')

# hidratacio-conductancia global
correlacio_hidratacio_conductancia(data['hidratacio'], data['conductancia'], "control+estres")

# hidratacio-conductancia control
control = data[data$condicio == "1",]
correlacio_hidratacio_conductancia(control['hidratacio'], control['conductancia'], "control")

# hidratacio-conductancia estres
estres = data[data$condicio == "2",]
correlacio_hidratacio_conductancia(estres['hidratacio'], estres['conductancia'], "estres")