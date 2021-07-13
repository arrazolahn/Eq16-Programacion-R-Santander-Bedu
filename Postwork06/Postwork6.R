#Importa el conjunto de datos match.data.csv a R y realiza lo siguiente:

library("dplyr")
library("lubridate")

data <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2021/main/Sesion-06/Postwork/match.data.csv")
head(data) #examinamos el archivo

#1. Agrega una nueva columna sumagoles que contenga la suma de goles por partido.
#El resultado sera la suma de goles del equipo visitante más los del equipo local

data$sumagoles <- data$home.score + data$away.score
head(data)

#2. Obtén el promedio por mes de la suma de goles.

#Separamos los datos creando una nueva variable para el numero de mes
data$month <- as.numeric(month(data$date))
#Y otra columna para el año
data$year <- as.numeric(year(data$date))
head(data)
summary(data)

#Agrupamos los datos por año y por mes, y creamos el promedio

df <- data %>% 
  group_by(year,month) %>%
  
  summarize(promedio_goles=mean(sumagoles))

head (df)

dataOrder <- df[order(df$year,df$month),]
head(dataOrder)

#3. Crea la serie de tiempo del promedio por mes de la suma de goles hasta diciembre de 2019.
goles.ts <- ts(dataOrder[,3],start = c(2010,8), frequency = 12,end = c(2019,12))

#4. Grafica la serie de tiempo.
plot(goles.ts, xlab = "", ylab = "")
title(main = "Serie de Tiempo Goles",
      ylab = "Goles",
      xlab = "Escala de tiempo (mes)")
