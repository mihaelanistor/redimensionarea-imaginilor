%Implementarea a proiectului Redimensionare imagini
%dupa articolul "Seam Carving for Content-Aware Image Resizing", autori S.
%Avidan si A. Shamir 
%%
%aceasta functie ruleaza intregul proiect 
%setati parametri si imaginile de redimensionat aici

%citeste o imagine
img = imread('../data/castel.jpg');

%reducem imaginea in latime cu 20 de pixeli
%seteaza parametri
parametri.optiuneRedimensionare = 'micsoreazaLatime';
parametri.numarPixeliLatime = 100;
parametri.numarPixeliInaltime = 100;
parametri.valoareScalare = 1.2;
parametri.ploteazaDrum = 0;
parametri.culoareDrum = [255 0 0]';%culoarea rosie
parametri.metodaSelectareDrum = 'programareDinamica';%optiuni posibile: 'aleator','greedy','programareDinamica'


imgRedimensionata_proiect = redimensioneazaImagine(img,parametri); 
imshow(imgRedimensionata_proiect)
%foloseste functia imresize pentru redimensionare traditionala
imgRedimensionata_traditional = imresize(img,[ size(imgRedimensionata_proiect,1) size(imgRedimensionata_proiect,2)]);

%ploteaza imaginile obtinute
figure, hold on;

%1. imaginea initiala
h1 = subplot(1,3,1);imshow(img);
xsize = get(h1,'XLim');ysize = get(h1,'YLim');
xlabel('imaginea initiala');

%2. imaginea redimensionata cu pastrarea continutului
h2 = subplot(1,3,2);imshow(imgRedimensionata_proiect);
set(h2, 'XLim', get(h2,'XLim'), 'YLim', get(h2,'YLim'));
xlabel('rezultat proiect');
impixelinfo;
%3. imaginea obtinuta prin redimensionare traditionala
h3 = subplot(1,3,3);imshow(imgRedimensionata_traditional);
set(h2, 'XLim', get(h3,'XLim'), 'YLim', get(h3,'YLim'));
xlabel('rezultat imresize');
