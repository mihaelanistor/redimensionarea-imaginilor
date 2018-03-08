function d = selecteazaDrumVerticalPentruEliminareObiect(E,xminim,width,pozitie)
    
    M = zeros(size(E));

    % daca poza primita e cea din partea de jos a obiectului
    % vreau ca drumul sa inceapa din unul din pixelii de sub obiectul
    % selectat, asa ca pun valori foarte mari celorlalti
    % pixeli de pe primul rand
    
    if (pozitie == 'jos')
        M(1,1:xminim-1) = Inf;
        M(1,xminim:xminim+width) = E(1,xminim:xminim+width);
        M(1,xminim+width+1:end) = Inf;
    else
        M(1,:) = E(1, :);
    end
        
    for i = 2:size(M,1)
        for j = 1:size(M,2)
            if (j == 1)
            	M(i,j) = E(i,j) + min([M(i-1,j),M(i-1,j+1)]);
            else
                if(j == size(M,2))
                	M(i,j) = E(i,j) + min([M(i-1,j-1),M(i-1,j)]);
            	else
                        M(i,j) = E(i,j) + min([M(i-1,j-1) M(i-1,j) M(i-1,j+1)]);
                end
            end
        end
    end
    
    %daca poza e partea de sus a obictului ce trebuie eliminat
    %aleg drumul ce se termine cu primul pixel din dreptul obiectului
    
    if(pozitie == 'sus')
    	coloana = xminim;
    else
    	ultimaLinie = M(end,:);
        coloana = find(ultimaLinie == min(ultimaLinie),1);
    end
	
    d = zeros(size(M,1),2);
    d(size(M,1),:) = [size(M,1) coloana];
        
    for i = size(M,1)-1:-1:1
        if coloana == 1
            v = [M(i,1) M(i,2)];
        	nouaColoana = find(v == min(v),1);
        else
            if coloana == size(M,2)
            	v = [M(i,end-1) M(i,end)];
                pozMinim = find(v == min(v),1);
                nouaColoana = coloana + pozMinim - 2;
            else
                v = [M(i,coloana-1) M(i,coloana) M(i,coloana+1)];
                pozMinim = find(v == min(v),1);
                nouaColoana = coloana + pozMinim - 2;
            end
        end
        
        d(i,:) = [i nouaColoana];
        coloana = nouaColoana;
    end
    
end