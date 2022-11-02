clc;
clear all;
close all;

%Extraccion de las imagenes
ruta = {'IMG/1.jpg','IMG/2.jpg','IMG/3.jpg','IMG/4.jpg'};

for k=1:4
    %Abrir la imagen
    img=imread(string(ruta(k)));

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
    gauss=fspecial('gaussian',[4,4]);%Matriz 4x4
    imgFGg=imfilter(imgRG,media);
    imgFGsp=imfilter(imgRSP,media);
    imgFGum=imfilter(imgRUm,media);

    %Mostramos imagenes
    figure
    imshow(img)
    title('Original')

    figure
    subplot(3,3,1)
    imshow(imgRG)
    title('Ruido Gaussiano')
    subplot(3,3,2)
    imshow(imgFMg);
    title('Filtro Media 4x4')
    subplot(3,3,3)
    imshow(imgFGg);
    title('Filtro Gaussiano 4x4')

    subplot(3,3,4)
    imshow(imgRSP)
    title('Ruido Impulsivo')
    subplot(3,3,5)
    imshow(imgFMsp)
    title('Filtro Media 4x4')
    subplot(3,3,6)
    imshow(imgFGsp)
    title('Filtro Gaussiano 4x4')

    subplot(3,3,7)
    imshow(imgRUm)
    title('Ruido Multiplicativo')
    subplot(3,3,8)
    imshow(imgFMum)
    title('Filtro Media 4x4')
    subplot(3,3,9)
    imshow(imgFGum)
    title('Filtro Gaussiano 4x4')

    %%FILTROS PROPUESTOS
        %Filtro de la media
    % for i=1:4
    %     for j=1:4
    %         med(i,j)=randi([1 3],1,1);
    %     end
    % end
    med=[1.5,1,1,1.5;1,1,1,1;1,1,1,1;1.5,1,1,1.5];
    m=sum(sum(med));
    for i=1:4
        for j=1:4
            med(i,j)=1/m;
        end
    end
    %Aplicacion de la mascara
    imgFMPg=imfilter(imgRG,med);
    imgFMPsp=imfilter(imgRSP,med);
    imgFMPum=imfilter(imgRUm,med);

        %Filtro Gaussiano
    %Distribucion normal
    x=[-1,0,1];
    mu=2;
    sigma=1.1;
    y=normpdf(x,mu,sigma);
    gau=[y(1),y(2),y(2),y(1);y(2),y(3),y(3),y(2);y(2),y(3),y(3),y(2);y(1),y(2),y(2),y(1)];%Mascara
    imgFGPg=imfilter(imgRG,media);
    imgFGPsp=imfilter(imgRSP,media);
    imgFGPum=imfilter(imgRUm,media);

    %Mostramos las imagenes
    figure
    subplot(3,3,1)
    imshow(imgRG)
    title('Ruido Gaussiano')
    subplot(3,3,2)
    imshow(imgFMPg)
    title('Filtro Media Propuesto')
    subplot(3,3,3)
    imshow(imgFGPg)
    title('Filtro Gaussiano Propuesto')

    subplot(3,3,4)
    imshow(imgRSP)
    title('Ruido Impulsivo')
    subplot(3,3,5)
    imshow(imgFMPsp)
    title('Filtro Media Propuesto')
    subplot(3,3,6)
    imshow(imgFGPsp)
    title('Filtro Gaussiano Propuesto')

    subplot(3,3,7)
    imshow(imgRSP)
    title('Ruido Impulsivo')
    subplot(3,3,8)
    imshow(imgFMPum)
    title('Filtro Media Propuesto')
    subplot(3,3,9)
    imshow(imgFGPum)
    title('Filtro Gaussiano Propuesto')
end