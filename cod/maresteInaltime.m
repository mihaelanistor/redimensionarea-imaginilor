function img1 = maresteInaltime(img,numarPixeliInaltime,metodaSelectareDrum,ploteazaDrum,culoareDrum)
  
    %maresteInaltime se foloseste de functia maresteLatime
    %rotesc poza cu 90 grade, o maresc pe latime si apoi 
    %o rotesc inapoi cu -90 grade

    imgRotita = imrotate(img,90);

    imgRedimensionata = maresteLatime(imgRotita,numarPixeliInaltime,metodaSelectareDrum,...
                        ploteazaDrum,culoareDrum);
    
    img1 = imrotate(imgRedimensionata, -90);

end

