# Taller de análisis de imágenes por software

## Propósito

Introducir el análisis de imágenes/video en el lenguaje de [Processing](https://processing.org/).

## Tareas

Implementar las siguientes operaciones de análisis para imágenes/video:

* Conversión a escala de grises.
* Aplicación de algunas [máscaras de convolución](https://en.wikipedia.org/wiki/Kernel_(image_processing)).
* (solo para imágenes) Despliegue del histograma.
* (solo para imágenes) Segmentación de la imagen a partir del histograma.
* (solo para video) Medición de la [eficiencia computacional](https://processing.org/reference/frameRate.html) para las operaciones realizadas.

Emplear dos [canvas](https://processing.org/reference/PGraphics.html), uno para desplegar la imagen/video original y el otro para el resultado del análisis.

## Integrantes

Complete la tabla:

| Integrante | github nick |
|------------|-------------|
| Jhon Torres | jhont285 |
| Dago Fonseca | dagofonseca |
| Camilo Pinzon | capinzonr |
## Discusión

# Máscaras de convolución

Images Original 

![Detección de bordes:](/taller1/taller1Mascaras/data/mandrill.png)

* Se aplicaron tres máscaras de convolución
  * **Detección de bordes:** El objetivo es resaltar los bordes de la imagen y se logra por medio de la detección drástica de brillo de la imagen y se utiliza principalmente para la identificación de patrones.
  
  ![Detección de bordes:](/taller1/taller1Mascaras/data/bordes.png)
  * **Desenfoque de cuadro:** El objetivo es suavizar la imagen, tiene su nombre porque obtiene el mismo efecto que si tomamos una fotografía desenfocada. Por otro lado, hay que tener en cuenta que pierde nitidez y claridad.
  
  ![Desenfoque de cuadro](/taller1/taller1Mascaras/data/cuadro.png)
  * **Enfocar:** El objetivo como su nombre lo indica es enfocar el objeto en primer plano y que se vea de manera mas nítida como se muestra en la imagen.

  ![alt text](/taller1/taller1Mascaras/data/enfocar.png)

## Entrega

* Hacer [fork](https://help.github.com/articles/fork-a-repo/) de la plantilla. Plazo: 28/4/19 a las 24h.
* (todos los integrantes) Presentar el trabajo presencialmente en la siguiente sesión de taller.
