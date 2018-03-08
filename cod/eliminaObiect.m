function img1 = eliminaObiect(img)
    % functia eliminaObiect primeste ca parametru o imagine si returneaza
    % imaginea initiala fara un obiect selectat din ea
    
    % imaginea initiala o decupez si obtine 4 imagini:
        % partea de deasupra obiectului
        % partea din stanga obiectului
        % partea din dreapta obiectului
        % partea de sub obiect
        
    % caz latimeObiect <= inaltimeObiect
        % bucatile de imagine din stanga si din dreapta obiectului raman
        % nemodificate
    
        % din bucatile de imagine de deasupra si de desubtul obiectului vor
        % fi eliminate un numar de drumuri egal cu latimeaObiectului
        
        % functia care elimina drumuri a fost modificata pt acest punct ca
        % drumurile sa  inceapa/se termine  in dreptul dreptunghiului cu obiectul
    % caz inaltimeObiect < latimeObiect
        % rotesc imaginea initiala 
        % recalculez xmin, ymin, inaltimeImagine(h), latimeImagine(w)
        % aplic aceeasi pasi de la primul caz
    imshow(img);
    rect = getrect;
    
    xmin = round(rect(1));
    ymin = round(rect(2));
    w = round(rect(3));
    h = round(rect(4));
    
    if(w <= h)
        rotire = 0;
    else
        rotire = 1;
        img = imrotate(img, 90);
        
        aux = xmin;
        xmin = ymin;
        ymin = size(img,1) - (aux + w) ;
        
        aux = w;
        w = h;
        h = aux;
        
    end
    
    
	img1 = uint8(zeros(size(img,1), size(img,2)-w, size(img,3)));
    nrPixeliDeEliminat = w;
    imgDeasupraObiect = img(1:ymin-1,:,:);
    imgSubObiect = img(ymin+h+1:end,:,:);
    for i=1:w
          
        E = calculeazaEnergie(imgDeasupraObiect);
        drum = selecteazaDrumVerticalPentruEliminareObiect(E,xmin,nrPixeliDeEliminat,'sus');
        imgDeasupraObiect = eliminaDrumVertical(imgDeasupraObiect,drum);
            
        E = calculeazaEnergie(imgSubObiect);
        drum = selecteazaDrumVerticalPentruEliminareObiect(E,xmin,nrPixeliDeEliminat,'jos');
        imgSubObiect = eliminaDrumVertical(imgSubObiect,drum);
        nrPixeliDeEliminat = nrPixeliDeEliminat - 1;
            
    end
    
    %copiem im poza finala
    
    %partea de deasupra obiectului
    img1(1:size(imgDeasupraObiect,1),:,:) = imgDeasupraObiect(:,:,:);
    %partea din stanga obiectului
    img1(ymin:ymin+h,1:xmin-1,:) = img(ymin:ymin+h,1:xmin-1,:);
    %partea din dreapta obiectului
    img1(ymin:ymin+h,xmin:end,:) = img(ymin:ymin+h,xmin+w:end,:);
    %partea de sub obiect
    img1(ymin+h+1:end,:,:) = imgSubObiect(:,:,:);
        
    if(rotire == 1)
        img1 = imrotate(img1, -90);
    end
    
end