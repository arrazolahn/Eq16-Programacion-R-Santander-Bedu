# Postwork Sesión 1.

#### Instrucciones

El siguiente postwork, te servirá para ir desarrollando habilidades como si se tratara de un proyecto que evidencie el progreso del aprendizaje durante el módulo, sesión a sesión se irá desarrollando. A continuación aparecen una serie de objetivos que deberás cumplir, es un ejemplo real de aplicación y tiene que ver con datos referentes a equipos de la liga española de fútbol (recuerda que los datos provienen siempre de diversas naturalezas), en este caso se cuenta con muchos datos que se pueden aprovechar, explotarlos y generar análisis interesantes que se pueden aplicar a otras áreas. Siendo así damos paso a las instrucciones: 

1. Importa los datos de soccer de la temporada 2019/2020 de la primera división de la liga española a `R`, los datos los puedes encontrar en el siguiente enlace: https://www.football-data.co.uk/spainm.php

2. Del data frame que resulta de importar los datos a `R`, extrae las columnas que contienen los números de goles anotados por los equipos que jugaron en casa (FTHG) y los goles anotados por los equipos que jugaron como visitante (FTAG)

3. Consulta cómo funciona la función `table` en `R` al ejecutar en la consola `?table`
 
Posteriormente elabora tablas de frecuencias relativas para estimar las siguientes probabilidades:

- La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x = 0, 1, 2, ...)
- La probabilidad (marginal) de que el equipo que juega como visitante anote y goles (y = 0, 1, 2, ...)
- La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que juega como visitante anote y goles (x = 0, 1, 2, ..., y = 0, 1, 2, ...)

__Notas para los datos de soccer:__ https://www.football-data.co.uk/notes.txt

#### Solución
<br />
    <a href="Postwork01.R"><strong>Ver el código</strong></a>
    <br/>

1. Importamos los datos desde la liga
```r
data <- read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

```
2. Extraemos las columnas FTHG y FTAG
```r
datCasa<-data$FTHG
datVisitante<-data$FTAG
```
3. Con la función `table` obtenemos las diferentes probabilidades

- La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x = 0, 1, 2, ...) 
```r
(tablaCasa<-table(datCasa))
(totalGoles<-table(datVisitante,datCasa))
(totalFrecAbsoluta <- sum(totalGoles))
(FrecRelCasa<-round (tablaCasa/totalFrecAbsoluta,4))
```

![Resultados en R](img1.png)


- La probabilidad (marginal) de que el equipo que juega como visitante anote y goles (y = 0, 1, 2, ...)
```r
(tablaCasa<-table(datVisitante))
(FrecRelVisitante<-round (tablaCasa/totalFrecAbsoluta,4))
```
![Resultados en R](img2.png)

- La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que juega como visitante anote y goles (x = 0, 1, 2, ..., y = 0, 1, 2, ...)

```r
(FrecRelCon<-round(totalGoles/totalFrecAbsoluta,4))
```
![Resultados en R](img3.png)
