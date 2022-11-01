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
media=fspecial('average',[4,4]);%Matriz 4x4
imgFMg=imfilter(imgRG,media);
imgFMsp=imfilter(imgRSP,media);
imgFMum=imfilter(imgRUm,media);

%Filtro gaussiano
gauss=fspecial('gaussian',[4,4]);
imgFGg=imfilter(imgRG,media);
imgFGsp=imfilter(imgRSP,media);
imgFGum=imfilter(imgRUm,media);

%Mostramos imagenes
figure
subplot(4,3,1)
imshow(img)
title('Original')

subplot(4,3,4)
imshow(imgRG)
title('Ruido Gaussiano')
subplot(4,3,5)
imshow(imgFMg);
title('Filtro Media 4x4')
subplot(4,3,6)
imshow(imgFGg);
title('Filtro Gaussiano 4x4')

subplot(4,3,7)
imshow(imgRSP)
title('Ruido Impulsivo')
subplot(4,3,8)
imshow(imgFMsp)
title('Filtro Media 4x4')
subplot(4,3,9)
imshow(imgFGsp)
title('Filtro Gaussiano 4x4')

subplot(4,3,10)
imshow(imgRUm)
title('Ruido Multiplicativo')
subplot(4,3,11)
imshow(imgFMum)
title('Filtro Media 4x4')
subplot(4,3,12)
imshow(imgFGum)
title('Filtro Gaussiano 4x4')