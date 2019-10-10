function [licznik,komorka]=ustawnumer(licznik,komorka)

for i=1:size(komorka,1)
    licznik=licznik+1;
    komorka{i,1}=num2str(licznik);
end