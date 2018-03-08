function img = micsoreazaInaltime(img,numarPixeliInaltime,metodaSelectareDrum,ploteazaDrum,culoareDrum)
    %functia micsoreazaInaltime se foloseste de functia micsoreazaLatime
    %apelez functia micsoreazaLatime cu imaginea rotita apoi o rotesc
    %inapoi

    imgRotita = imrotate(img,90);
    
    imgRotitaRedim = micsoreazaLatime(imgRotita,numarPixeliInaltime,metodaSelectareDrum,...
                            ploteazaDrum,culoareDrum);
    
    img = imrotate(imgRotitaRedim,-90);

end

