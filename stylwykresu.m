function [kolor linia]=stylwykresu(numer)

kolor='w';
linia='-';
kolorki={'r', 'c', 'y', 'g', 'm', 'b', 'k'};
symbole={'-', ':', '--'};
if numer<8
    linia=symbole{1,1};
    kolor=kolorki{1,numer};
elseif numer>=8 && numer<15
    linia=symbole{1,2};
    kolor=kolorki{1,(numer-7)};
else
    linia=symbole{1,3};
    kolor=kolorki{1,(numer-14)};
end