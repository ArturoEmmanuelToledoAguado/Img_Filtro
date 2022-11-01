clc;
clear all;
close all;

%Abrir la imagen
img=imread('IMG/1.jpg');

%%RUIDOS
%Ruido Gaussiano
imgRG=imnoise(img,'gaussian');

%Ruido Impulsivo (Sal y Pimienta)
imgRSP=imnoise(img,'salt & pepper');

%Ruido Uniforme (multiplicativo)
imgRUm=imnoise(img,'speckle');

%%FILTROS DE MATLAB
%Filtro de la media (promediador='average')

%Mostramos imagenes
figure
subplot(4,3,1)
imshow(img)
title('Original')

subplot(4,3,4)
imshow(imgRG)
title('Ruido Gaussiano')

subplot(4,3,7)
imshow(imgRSP)
title('Ruido Impulsivo')

subplot(4,3,10)
imshow(imgRUm)
title('Ruido Multiplicativo')