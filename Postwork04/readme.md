# Postwork Sesión 4

#### Conocimientos adquiridos

- Investigar la dependencia o independecia de las variables aleatorias X y Y, el número de goles anotados por el equipo de casa y el número de goles anotados por el equipo visitante.

#### Instrucciones
Ahora investigarás la dependencia o independencia del número de goles anotados por el equipo de casa y el número de goles anotados por el equipo visitante mediante un procedimiento denominado bootstrap, revisa bibliografía en internet para que tengas nociones de este desarrollo. 

1. Ya hemos estimado las probabilidades conjuntas de que el equipo de casa anote X=x goles (x=0,1,... ,8), y el equipo visitante anote Y=y goles (y=0,1,... ,6), en un partido. Obtén una tabla de cocientes al dividir estas probabilidades conjuntas por el producto de las probabilidades marginales correspondientes.

2. Mediante un procedimiento de boostrap, obtén más cocientes similares a los obtenidos en la tabla del punto anterior. Esto para tener una idea de las distribuciones de la cual vienen los cocientes en la tabla anterior. Menciona en cuáles casos le parece razonable suponer que los cocientes de la tabla en el punto 1, son iguales a 1 (en tal caso tendríamos independencia de las variables aleatorias X y Y).

__Notas para los datos de soccer:__ https://www.football-data.co.uk/notes.txt

#### Solución
<br />
    <a href="Postwork04.R"><strong>Ver el código</strong></a>
    <br/>

1. Tabla de cocientes

```r
M <- matrix(0,nrow = length(listaCasa), ncol = length(listaVis))
for (i in 1:9) {
  for (j in 1:7) {
    M[i,j] = round(listaCasa[i]*listaVis[j],4)
  }
}
(ProbCon<-as.matrix(FrecRel))
(ProbCon<-t(ProbCon))
```

<p align="center">
        <img src="https://github.com/arrazolahn/Eq16-Programacion-R-Santander-Bedu/blob/main/Postwork04/imagenes/img1.PNG">
</p>

1. Obtención de más cocientes similares a los obtenidos en la tabla del punto anterior por medio de bootstrap

```r
#Limpieza de Datos para obtener la media, cambiamos infty y NAN por la media 
IndepEst<-(round(M/ProbCon,3))
(IndepEst<-as.data.frame(IndepEst))
IndepEst <- IndepEst %>% mutate_if(is.numeric, function(x) ifelse(is.infinite(x), 0, x))
IndepEst$Freq[which(is.na(IndepEst$Freq))]<-mean(IndepEst$Freq,na.rm = TRUE)
IndepEst$Freq[IndepEst$Freq == 0]<-mean(IndepEst$Freq)
media = mean(IndepEst$Freq)
varianza = var(IndepEst$Freq)
##Bootstrap muestreo con reemplazo Suponiendo que la muestra de
#La frecuencia viene de una distribuciÃ³n normal 
set.seed(1200)
muestra<- rnorm(n=200,mean=media, sd=sqrt(varianza))
xbarra = mean(muestra)
bootstrap <- replicate(n=1000, sample(muestra,replace=TRUE))
(medias<-apply(bootstrap, MARGIN = 2, FUN = mean))
```

<p align="center">
        <img src="https://github.com/arrazolahn/Eq16-Programacion-R-Santander-Bedu/blob/main/Postwork04/imagenes/img2.PNG">
</p>

De las muestras generadas aleatoriamente se puede concluir que al valor que tiende la media es a 0.8235 por lo tanto, los cocientes que estan cercanos a esta relacion se les puede considerar indpendientes estadÃ­sticamente hablando.
Es decir, si son independientes quiere decir que la probabilidad de que el  equipo visitante anote 6 goles no depende de la probabilidad de que la casa anote 1 gol; 
Sin embargo, en un sentido estricto, aunque la varianza muestral haya sido pequeña (0.00058) y la media 0.82. Esto no asegura que Sean completamente independientes ya que estrictamente se requiere que el cociente sea 1.
