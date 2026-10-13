### Exoploración de datos demográficos

## Descripción de la muestra


# 00.setup -------------------------------------------------------------------
# En esta seeción preparamos todo lo que necesitamos para nuestro procesamiento

## librerias -------------------------------------------------------------

library(tidyverse) # universo de librerías con filosofía tidy
library(janitor) # libreria para la limpieza y armado de tablas rápidas
library(gt) # una librería para hermosear tablas

## cargo bases ------------------------------------------------------------

df <-readRDS("input/base_2024_final_anoni1 (3).rds") |> 
  filter(carrera == "1- Sociología") |> # me quedo sólo con sociólogos
  clean_names() # emprolijo los nombres de las columnas


## Genero 

df |> 
  tabyl(genero_r) |> 
  adorn_pct_formatting() |> 
  adorn_totals()


# Se cuenta 99 casos 38% (37) de género masculino 61%(60) femenino y 2 personas con género "otros (2%). 
# Desición a tomar: ¿Excluimos a los 2 otres? En adelante por cuestiones de practicidad se excluyen del análisis estos dos casos debido a que....

## Edad en tramos
df |> 
  tabyl(edad_r) |> 
  adorn_pct_formatting() |> 
  adorn_totals()

# La cátedra propone analizar estos tramos ¿Por qué? 
# exploramos la edad de manera discreta y vemos su distribución en un 
df |> 
  ggplot(aes(x= edad))+
  geom_histogram(binwidth = 1)

summary(df$edad)



# si no me acuerdo como hacer el gráfico lo trabo con esta librería interactiva

#install.packages("esquisse")
library(esquisse)

variables_interes <- df |> select(edad,id,genero,genero_r)

esquisser(variables_interes)




