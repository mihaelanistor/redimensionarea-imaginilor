function img = amplificaContinut(img, valoareScalare, metodaSelectareDrum,ploteazaDrum,culoareDrum)
  
    %functia primeste ca parametru cu cat sa fie scalata poza;
    %scalez poza si calculez cati pixeli trebuie eliminati din inaltime si
    %din latime ca poza sa aiba aceeasi dimensiune ca poza initiala;
    %apelez functiile micsoreazaLatime si micsoreazaInaltime cu nr de
    %pixeli calculati

    hInitial = size(img,1);
    wInitial = size(img,2);
    
    img = imresize(img, valoareScalare);
    
    h = size(img,1);
    w = size(img,2);
    
    nrPixeliInaltime = h - hInitial;
    nrPixeliLatime = w - wInitial;

    img = micsoreazaLatime(img,nrPixeliLatime,metodaSelectareDrum,...
                            ploteazaDrum,culoareDrum);
    img = micsoreazaInaltime(img,nrPixeliInaltime,metodaSelectareDrum, ...
                            ploteazaDrum,culoareDrum);
end

