*np.comp.1f()*

## Descripción y objetivo
Imagina que quermos evaluar si existen diferencias significatias entre los niveles de un factor (variable independiente) para muchas variables dependientes (p.ej.: >10) y que además, nuestros datos, no siguen una distribución normal, ni son homocedásticos y las transformaciones no han logrado que se cumplan estas asunciones. Entonces, en esta situación, resulta inevitable recurrir a los test no paramétricos, como el Kruskal-Wallis (análogo al test ANOVA) y el test de Dunn (análogo al test de Tukey de comparaciones múltiples).

Además, tendríamos que escribir una línea de código por cada variable	 dependiente y por cada test. Esto es, si tuviesemos 10 variables dependientes habría que escribir, como mínimo, 20 líneas (10 aplicando el test de Kruskal-Wallis y otras 10 para el test de Dunn). Sin duda, deberíamos invertir bastante tiempo en ello y ocuparíamos mucho espacio en nuestro script.

Con esta función podemos aplicar el test de Kruskal-Wallis o el de Dunn a cada una de las diferentes variables dependientes respecto a un único factor (variable independiente), reduciendo de forma manifiesta tanto el tiempo como la cantidad de código a escribir.

## Argumentos de la función:

- **x**: es el dataframe donde se almacenan las variables objeto de estudio.

- **nombre.variables**: el nombre de las columnas que se corresponden a la variables dependientes, que han de ser de tipo cuantitativo.

- **variable.factor**: el nombre de la columna que se corresponde a la variable de tipo factor, que han de ser de tipo cualitativo o 	cuantitativo discreto.

- **dunn**: indica si quieres que se realize el test de Dunn de comparaciones múltiples o no. Por defecto, dunn=F, sólo se realiza el test de *Kruskal-Wallis()*.

- **...**: otros argumentos que se le puedan añadir a la función dunnTest del paquete FSA.

## Observaciones

- Es necesario tener instalado el paquete FSA para poder realizar el test de Dunn.
- Por defecto se utiliza el método Holm (method="Holm) de la función *dunnTest()*

## Resultados

- Cuando se aplica el test de Kruskal-Wallis el resultado es una matriz de 2 filas x n columnas (tantas como variables dependientes se hayan introducido): i) la primera fila alberga el nombre de las diferentes variables dependientes y ii) la segunda los p-value de las comparaciones entre cada variable dependiente y los niveles del factor escogido (variable independiente).

- Por otro lado, si realizamos el test de dunn (dunn=T o dunn=TRUE), la función nos devolverá una lista donde cada elemento de la misma contendrá la matriz de comparación entre los diferentes niveles del factor (variable independiente) para cada variable dependiente.


## Ejemplo
Copia y pega las siguientes líneas de código y observa cómo trabaja la función:
~~~
set.seed(666)
prueba<-data.frame(variable1=runif(16),
                   variable2=rnorm(16),
                   factor1=rep(c("a","b"),each=8),
                   factor2=c(rep(c("x","y","z"),4),rep("x",4)))


np.comp.f(prueba,c("variable1","variable2"), # KRUSKAL-WALLIS TEST
	"factor2")

np.comp.f(prueba,c("variable1","variable2"), # DUNN TEST 
	"factor2",
	dunn=T,method="holm")
~~~
## Referencias

Ogle, D.H., P. Wheeler, and A. Dinno. 2019. FSA: Fisheries Stock Analysis. R package version 0.8.26, https://github.com/droglenc/FSA.
