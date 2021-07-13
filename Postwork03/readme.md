# Postwork Sesión 3

#### Conocimientos adquiridos

- Realizar descarga de archivos desde internet
- Generar nuevos data frames
- Visualizar probabilidades estimadas con la ayuda de gráficas

#### Instrucciones

Ahora graficaremos probabilidades (estimadas) marginales y conjuntas para el número de goles que anotan en un partido el equipo de casa o el equipo visitante.

1. Con el último data frame obtenido en el postwork de la sesión 2, elabora tablas de frecuencias relativas para estimar las siguientes probabilidades:

- La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x=0,1,2,)

- La probabilidad (marginal) de que el equipo que juega como visitante anote y goles (y=0,1,2,)

- La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que juega como visitante anote y goles (x=0,1,2,, y=0,1,2,)

2. Realiza lo siguiente:

- Un gráfico de barras para las probabilidades marginales estimadas del número de goles que anota el equipo de casa.
- Un gráfico de barras para las probabilidades marginales estimadas del número de goles que anota el equipo visitante.
- Un HeatMap para las probabilidades conjuntas estimadas de los números de goles que anotan el equipo de casa y el equipo visitante en un partido.

__Notas para los datos de soccer:__ https://www.football-data.co.uk/notes.txt

#### Solución
<br />
    <a href="Postwork31.R"><strong>Ver el código</strong></a>
    <br/>

1.1 La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x=0,1,2,)
```r
(ProbCasa<-round(table(datCasa)/sumaFrecAbs,4))
```
<p align="center">
        <img src="https://github.com/arrazolahn/Eq16-Programacion-R-Santander-Bedu/blob/main/Postwork03/imagenes/img1.PNG">
</p>

1.2 La probabilidad (marginal) de que el equipo que juega como visitante anote y goles (y=0,1,2,)                                                                                                                
```r
(ProbVis<-round(table(datVis)/sumaFrecAbs,4))
```                                                                                                                        
<p align="center">
        <img src="https://github.com/arrazolahn/Eq16-Programacion-R-Santander-Bedu/blob/main/Postwork03/imagenes/img2.PNG">
</p>

1.3 La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que juega como visitante anote y goles (x=0,1,2,, y=0,1,2,)

```r
(FrecRel<-round(FrecAbs/sumaFrecAbs,4))
```

<p align="center">
        <img src="https://github.com/arrazolahn/Eq16-Programacion-R-Santander-Bedu/blob/main/Postwork03/imagenes/img3.PNG">
</p>


2.1 Gráfico de barras para las probabilidades marginales estimadas del número de goles que anota el equipo de casa.
```r
barplot(ProbCasa,xlab="Goles anotados", ylab="Probabilidad", 
        main = "Probabilidad de anotar goles por el equipo de la casa",
        ylim =c(0,0.5),
        col = rgb(0.8,0.1,0.1,0.6))
```

<p align="center">
        <img src="https://github.com/arrazolahn/Eq16-Programacion-R-Santander-Bedu/blob/main/Postwork03/imagenes/img4.PNG">
</p>
2.2 Gráfico de barras para las probabilidades marginales estimadas del número de goles que anota el equipo visitante.
```r
barplot(ProbVis,xlab="Goles anotados", ylab="Probabilidad", 
        main = "Probabilidad de anotar goles por el equipo visitante",
        ylim =c(0,0.5),
        col = rgb(0.8,0.1,0.1,0.6))
```

<p align="center">
        <img src="https://github.com/arrazolahn/Eq16-Programacion-R-Santander-Bedu/blob/main/Postwork03/imagenes/img5.PNG">
</p>
2.3 HeatMap de probabilidades conjuntas estimadas de los números de goles que anotan el equipo de casa y el equipo visitante en un partido.
```r
ggplot(as.data.frame(FrecRel), aes(x=datCasa, y=datVis,fill = Freq))+ 
  geom_tile()+ 
  geom_text(aes(label=round(Freq,4)))+
  scale_fill_gradient(low="pink", high="blue") +
  labs(x="Numero de Goles de la Casa")+
  labs(y="Numero de Goles del Visitante")+
  labs(fill="Probabilidad")
```

<p align="center">
        <img src="https://github.com/arrazolahn/Eq16-Programacion-R-Santander-Bedu/blob/main/Postwork03/imagenes/img6.PNG">
</p>
