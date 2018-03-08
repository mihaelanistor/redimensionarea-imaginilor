function img1 = adaugaDrumVertical(img,drum)
    %primeste ca parametru drumul ce trebuie dublat din imagine
    
    %inlocuiesc drumul primit ca parametru  cu media dintre el si drumul
    %din stanga lui
    %adaug un drum nou in dreapta drumului primit ca parametru care e media
    %dintre el si drumul din drepata lui
    img1 = zeros(size(img,1),size(img,2)+1,size(img,3),'uint8');

    for i=1:size(img,1)
        coloana = drum(i,2);

        %coloana la marginea din stanga
        if(coloana == 1)

            %adaugam drum dublat
            img1(i,coloana,:) = img(i,drum(i,2),:);
            img1(i,coloana+1,:) = round(img(i,drum(i,2),:)./2) + round(img(i,drum(i,2)+1,:)./2);


            %copiem partea din dreapta
            img1(i,coloana+2:end,:) = img(i,coloana+1:end,:);

        %coloana la marginea din dreapta    
        elseif(coloana == size(img,2))

            %copiem partea din stanga
            img1(i,1:coloana-1,:) = img(i,1:coloana-1,:);

            %adaugam drum dublat
            img1(i,coloana,:) = round(img(i,drum(i,2)-1,:)./2) + round(img(i,drum(i,2),:)./2);
            img1(i,coloana+1,:) = img(i,drum(i,2),:);

        %caz general    
        else

            %copiem partea din stanga
            img1(i,1:coloana-1,:) = img(i,1:coloana-1,:);

            %adaugam drum dublat
            img1(i,coloana,:) = round(img(i,drum(i,2)-1,:)./2) + round(img(i,drum(i,2),:)./2);
            img1(i,coloana+1,:) = round(img(i,drum(i,2),:)./2) + round(img(i,drum(i,2)+1,:)./2);

            %copiem partea din dreapta
            img1(i,coloana+2:end,:) = img(i,coloana+1:end,:);

        end
    end

end

