# Postwork Sesión 6. 

#### Conocimientos adquiridos

- Aprender a crear una serie de tiempo en `R`

#### Instrucciones

Importa el conjunto de datos match.data.csv a `R` y realiza lo siguiente:

1. Agrega una nueva columna `sumagoles` que contenga la suma de goles por partido.

2. Obtén el promedio por mes de la suma de goles.

3. Crea la serie de tiempo del promedio por mes de la suma de goles hasta diciembre de 2019.

4. Grafica la serie de tiempo.

__Notas para los datos de soccer:__ https://www.football-data.co.uk/notes.txt

#### Solución
<br />
    <a href="Postwork06.R"><strong>Ver el código</strong></a>
    <br/>

1. Creamos la columna sumagoles como resultado de la suma del score del equipo de casa y el visitante 

```r
data$sumagoles <- data$home.score + data$away.score
```
<p align="center">
    <img src="https://github.com/arrazolahn/Eq16-Programacion-R-Santander-Bedu/blob/main/Postwork06/imagenes/img1.PNG">
</p>

3. 
