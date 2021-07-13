# Postwork Sesión 2.

#### Conocimientos adquirios

- Importar múltiples archivos csv a `R`
- Observar algunas características y manipular los data frames
- Combinar múltiples data frames en un único data frame

#### Instrucciones

Ahora vamos a generar un cúmulo de datos mayor al que se tenía, esta es una situación habitual que se puede presentar para complementar un análisis, siempre es importante estar revisando las características o tipos de datos que tenemos, por si es necesario realizar alguna transformación en las variables y poder hacer operaciones aritméticas si es el caso, además de sólo tener presente algunas de las variables, no siempre se requiere el uso de todas para ciertos procesamientos.

1. Importa los datos de soccer de las temporadas 2017/2018, 2018/2019 y 2019/2020 de la primera división de la liga española a `R`, los datos los puedes encontrar en el siguiente enlace: https://www.football-data.co.uk/spainm.php

2. Revisa la estructura de de los data frames al usar las funciones: `str`, `head`, `View` y `summary`

3. Con la función `select` del paquete `dplyr` selecciona únicamente las columnas `Date`, `HomeTeam`, `AwayTeam`, `FTHG`, `FTAG` y `FTR`; esto para cada uno de los data frames. (Hint: también puedes usar `lapply`).

4. Asegúrate de que los elementos de las columnas correspondientes de los nuevos data frames sean del mismo tipo (Hint 1: usa `as.Date` y `mutate` para arreglar las fechas). Con ayuda de la función `rbind` forma un único data frame que contenga las seis columnas mencionadas en el punto 3 (Hint 2: la función `do.call` podría ser utilizada).

__Notas para los datos de soccer:__ https://www.football-data.co.uk/notes.txt

#### Solución
<br />
    <a href="Postwork02.R"><strong>Ver el código</strong></a>
    <br/>

1. Importamos los datos de soccer de las temporadas 2017/2018, 2018/2019 y 2019/2020 de la 
  primera división de la liga española a R,desde https://www.football-data.co.uk/spainm.php  
  usando la funcion lapply y guardandolos en un dataframe
```r
setwd ("C:/Users/arraz/Documents/Bedu_statisticsWithR/spainleague") #Cambia el directorio al tuyo
  
  e11920 <- "https://www.football-data.co.uk/mmz4281/1920/SP1.csv"
  e11819 <- "https://www.football-data.co.uk/mmz4281/1819/SP1.csv"
  e11718 <- "https://www.football-data.co.uk/mmz4281/1718/SP1.csv"
  
  download.file(url = e11920, destfile = "e1-1920.csv", mode = "wb")
  download.file(url = e11819, destfile = "e1-1829.csv", mode = "wb")
  download.file(url = e11718, destfile = "e1-1719.csv", mode = "wb")
  
  dir() 
  ligaesp <- lapply(dir(), read.csv) 
```

2. Obtenemos una mejor idea de las características de los data frames al usar las funciones: str, head, View y summary
```r
  str(ligaesp[[1]]); str(ligaesp[[2]]); str(ligaesp[[3]])
  head(ligaesp[[1]]); head(ligaesp[[2]]); head(ligaesp[[3]])
  View(ligaesp[[1]]); View(ligaesp[[2]]); View(ligaesp[[3]])
  summary(ligaesp[[1]]); summary(ligaesp[[2]]); summary(ligaesp[[3]])
 
```
<p align="center">
        <img src="https://github.com/arrazolahn/Eq16-Programacion-R-Santander-Bedu/blob/main/Postwork02/imagenes/img1.PNG" alt="Tabla Frecuencia de locales">
</p>

3.Seleccionamos solo las columnas que utilizaremos usando `select` y `lapply`
```r
  ligaesp <- lapply(ligaesp, select, c("Date", "HomeTeam", "AwayTeam", "FTHG", "FTAG", "FTR")) 
```
4. Aseguramos de que los elementos de las columnas correspondientes de los nuevos data frames sean del mismo tipo 
   usamos as.Date y mutate para arreglar las fechas"
  
  ```r
  ligaesp[[1]] <- mutate(ligaesp[[1]], Date = as.Date(Date, format="%d/%m/%y"))
  ligaesp[[2]] <- mutate(ligaesp[[2]], Date = as.Date(Date, "%d/%m/%Y"))
  ligaesp[[3]] <- mutate(ligaesp[[3]], Date = as.Date(Date, "%d/%m/%Y"))
  
  ```
  <p align="center">
        <img src="https://github.com/arrazolahn/Eq16-Programacion-R-Santander-Bedu/blob/main/Postwork02/imagenes/img2.PNG" alt="Tabla Frecuencia de locales">
</p>
  
  Con la función rbind y do.call formamos un único data frame que contenga las seis columnas mencionadas en el punto 3 y lo guardamos como archivo 
  ```r
  data <- do.call(rbind, ligaesp)
  head(data)
  dim(data)
  
  write.csv(data, "soccer.csv", row.names = FALSE)
  ```
<br />
    <a href="soccer.csv"><strong>Ver archivo resultante</strong></a>
    <br/>
```r
```
