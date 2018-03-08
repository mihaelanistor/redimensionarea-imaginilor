# redimensionarea-imaginilor
Redimensionarea imaginilor cu pastrarea continutului

Descriere:
    
    Redimensionare imaginilor (marire sau micsorare) pe inaltime sau latime cu pastrarea continutului
    sau amplificarea continutului dintr-o imagine, fara a fi modificata dimensiunea imaginii.
    
Testare:
    
    Se ruleaza in Matlab scriprul "ruleazaProiect.m" din folderul cod dupa ce au fost setati parametri doriti:
      "optiuneRedimensionare" poate lua una din optiunile:
          - micsoreazaLatime
          - micsoreazaInaltime
          - maresteLatime
          - maresteInaltime
          - amplificaContinut
          - eliminaObiect
       Se alege numarul de pixeli care vor fi adaugati.eliminati pe latime/inaltime.
       Pentru optiunea "amplificaContinut" trebuie ales parametrul si "valoareScalare" (1.2 sau 1.3 pentru
       rezultate optime)
          - Pentru a amplifica continutul unei imagini, aceasta se redimensioneaza la 
          dimensiuneInitiala * valoareScalare, apoi se elimina pixeli pana imaginea ajunge la dimensiunea
          initiala
          
   Rezultate:
    
      Rezultatele obtinute: "MihaelaNistor_proiect2_rezultate.pdf"
      
       
