function [licznik,nowedane]=lokatyzpliku(licznik,komorka)

nowedane=cell(size(komorka,1),10);

[licznik,komorka]=ustawnumer(licznik,komorka);

for i=1:size(komorka,1)
        
    kwota=komorka{i,2};
    oprocentowanie=komorka{i,3};
    [dlugosc, jednostkadlug]=ustawczas(komorka{i,4});
    
    jednczas=0;
    if (strcmp(jednostkadlug,'miesiêcy')||strcmp(jednostkadlug,'miesi¹ce')||strcmp(jednostkadlug,'miesi¹c'))
        jednczas=1;
    elseif (strcmp(jednostkadlug,'dni')||strcmp(jednostkadlug,'dzieñ'))
        jednczas=2;
    else (strcmp(jednostkadlug,'rok')||strcmp(jednostkadlug,'lata')||strcmp(jednostkadlug,'lat'))
        jednczas=3;
    end
    rodzokrkap=ustawkapitalizacje(komorka{i,5});
    
    [czescroku,liczbaokresow]=obliczczescrokuiokresy(rodzokrkap,jednczas,dlugosc);
        
  
    kwotakoncowa=lokata(komorka{i,2},komorka{i,3},czescroku,liczbaokresow);
    
    kasa=zysk(kwota,kwotakoncowa,komorka{i,6});
    
    nowedane(i,:)={komorka{i,1}, kwota, oprocentowanie, komorka{i,4}, komorka{i,5}, kwotakoncowa, kasa, czescroku, liczbaokresow, komorka{i,6}};
end