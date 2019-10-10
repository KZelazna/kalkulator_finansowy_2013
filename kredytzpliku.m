function [licznik, nowedane]=kredytzpliku(licznik,komorka)

[licznik, komorka]=ustawnumer(licznik,komorka);
nowedane=cell(size(komorka,1),8);
for i=1:size(komorka,1)
    kwota=komorka{i,2};
    [dlugosc, jednostkadlug]=ustawczas(komorka{i,3});
    procent=komorka{i,4};
    rodzajraty=komorka{i,5};
    kwotakoncowa=0;
    odsetki=[];
    wysokoscrat=[];
    czasmies=dlugosc*12;
    if strcmp(komorka{i,5},'sta³a')
        [wysokoscrat,kwotakoncowa,odsetki]=ratastala(kwota,procent,czasmies);
        wysokoscrat=repmat(wysokoscrat,1,czasmies);
    else
        [wysokoscrat,kwotakoncowa,odsetki]=ratamalejaca(kwota,procent,czasmies);
    end
    nowedane(i,:)={komorka{i,1},kwota,komorka{i,3},procent,rodzajraty,kwotakoncowa,odsetki,wysokoscrat};
end