function img = maresteLatime(img,numarPixeliLatime,metodaSelectareDrum,ploteazaDrum,culoareDrum)

    matriceDrumuri = zeros(size(img,1),numarPixeliLatime,2);
    %fac o copie a imaginii, si elimin drumurile din copie, apoi adaug
    %drumurile in poza nemodificata
    img1 = img;

    for i = 1:numarPixeliLatime

        %calculeaza energia dupa ecuatia (1) din articol
        E = calculeazaEnergie(img1);

        %alege drumul vertical care conecteaza sus de jos
        drum = selecteazaDrumVertical(E,metodaSelectareDrum);

        %afiseaza drum
        if ploteazaDrum
            ploteazaDrumVertical(img1,E,drum,culoareDrum);
            pause(1);
            close(gcf);
        end

        %elimina drumul din imagine
        img1 = eliminaDrumVertical(img1,drum);

        %salvez drumul eliminat
        matriceDrumuri(:,i,:) = drum;    
 
        %verific cate drumuri au fost eliminate pana acum la stanga
        %drumului curent (= nr de pixeli cu care trebuie deplasat drumul la
        %drepata ca sa corespunda cu acelasi drum in poza initiala)
        for x = 1:i-1
            for y = 1:size(img1,1)
                if (matriceDrumuri(y,x,2) <= matriceDrumuri(y,i,2))
                    matriceDrumuri(y,i,2) = matriceDrumuri(y,i,2) + 1;
                end
            end
        end
    end
    
    for i = 1:numarPixeliLatime
        
        E = calculeazaEnergie(img);
        
        if ploteazaDrum
            ploteazaDrumVertical(img,E,matriceDrumuri(:,i,:),culoareDrum);
            pause(1);
            close(gcf);
        end

        img = adaugaDrumVertical(img,matriceDrumuri(:,i,:));
        
        %dupa ce adaug un drum, recalculez coloanele pentru drumurile de la
        %dreapta drumul adaugat
        
        for x = 1:numarPixeliLatime
            for y = 1:size(img1,1)
                if (matriceDrumuri(y,x,2) >= matriceDrumuri(y,i,2))
                    matriceDrumuri(y,x,2) = matriceDrumuri(y,x,2) + 1;
                end
            end
        end
        
    end

end

