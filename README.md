# Introducción 📖
Se investigo cómo son las mascaraa de los filtros Gaussianos y de la media y proponer unas mascaras propias de conectividad 4 y comparar los resultados con los filtros que proporciona Matlab; pero antes de comenzar:

## ¿Qué es el procesamiento digital de imagenes (PDI)? 🤷‍♂️🤷‍
PDI se puede definir como el conjunto de procesamientos que se realizan sobre una imagen digital ya sea para realizar su almacenamiento, transmisión o tratamiento.

## Lectura de imágenes en matlab 👓
Para leer una imágen en matlab se utiliza la función <a href="https://la.mathworks.com/help/matlab/ref/imread.html"> **imread**</a> y se asigna a una variable que representara a la imágen.

<h5 align="center"><code>imagen = imread('ruta/nombre de la imágen.extensión');</code></h5>

## VECINDARIO DEL PIXEL 🌇
Algo que tiene mucho peso en las imágenes es el concepto de **conectividad**. Hay mucoperaciones en el procesamiento de imágenes que utilizan un áream, llamada área de influencia para tratar un solo pixel.

Se consideran diferentes tipos de conectividad, por ejemplo conectividad 4 o conectividad 8, donde se consideran los pixeles conectados en diagonal.

//imagenes de conectividad

## FILTROS ESPACIALES 🌗
El empleo de máscaras para el procesamiento de las imágenes se denomina frecuentemente filtrado espacial y las máscaras se denominan filtros espaciales.

Podemos clasificarlos como:
* Filtros Suavisantes
* Filtros Resaltantes

### Filtros Suavisantes 🐰
Estos filtros se emplean parareducir ruido, pero dejan la imagen un poco borosa.

Hay filtros suavisantes **Lineales y No lineales**

#### Filtros Lineales
* En los filtros espaciales, el valor del filtro en un pixel está determinado como una combinación líneal de los valores de los pixeles vecinos
* En este tipo de filtros se realiza una operación de convolución entre la imagen a ser filtrada y una máscara
* El principal inconveniente de estas técnicas es el enturbiamiento que se produce en la imagen, provocando bordes difuminados, por lo que tienen que ser utilizados con precaución
* Los más usados son:
  * Filtro de la Media
  * Filtro Gaussiano

##### Filtro de la Media
* Este filtro es quizá el más sencillo de los filtros lineales
* Les da pesos iguales a todos los pixeles en el vecindario para reducir la cantidad de variaciones de intensidad entre pixeles vecinos

//imagen

* **Nota**.- Cada pixel se remplaza por la media de los pixeles vecinos

* En Matlab la función que permite realizar un filtro de la media es: <a href="https://la.mathworks.com/help/images/ref/imfilter.html">**imfilter**</a>

<h5 align="center"><code>imfiltrada=imfilter(A,H,option1,option2,...);</code></h5>

* Esta función filtra la imagen A con el filtro multidimensional H, los parámetros option1, option2, ..., son opciones de frontera, de tamaño de imagen de salida y opciones de correlación o convolución
* La función de Matlab que nos permite generar el filtro H es: <a href="https://la.mathworks.com/help/images/ref/fspecial.html?s_tid=doc_ta">**fspecial**</a>

<h5 align="center"><code>H=fspecial(type,parametros);</code></h5>

* La función <a href="https://la.mathworks.com/help/images/ref/fspecial.html?s_tid=doc_ta">**fspecial**</a> crea filtros bidimensionales del tipo especificado por type (filtro Gaussiano, un detector de bordes de Sobel, un operador Laplaciano, un filtro de la media, entre otros)
* Los parámetros dependen del tipo de filtro

A continuación se muestra un código de ejemplo:
~~~
close all;
clear all;
im=imread('cerezo.jpg');
imshow(im);title('Original');

imn=imnoise(im,'gaussian');
figure();imshow(imn);title('Gaussiano');

media=fspecial('average');%ventana 3x3
imfilt=imfilter(imn,media);
figure();imshow(imfilt);title('Filtro de media de 3x3');

media=fspecial('average',[9,9]);%ventana 9x9
imfilt=imfilter(imn,media);
figure();imshow(imfilt);title('Filtro de media de 9x9');
~~~

#### Resultados

//imagenes

<a href="https://github.com/ArturoEmmanuelToledoAguado/Img_Filtro/blob/main/Img_Filtro.m">Código</a>