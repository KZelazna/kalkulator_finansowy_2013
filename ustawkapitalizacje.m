function rodzokrkap=ustawkapitalizacje(komorka)

if (strcmp('miesiêczna',komorka) || strcmp('miesi¹c',komorka))
    rodzokrkap=2;
elseif (strcmp('dzienna',komorka) || strcmp('dzieñ',komorka))
    rodzokrkap=3;
elseif (strcmp('roczna',komorka) || strcmp('rok',komorka))
    rodzokrkap=4;
else
    rodzokrkap=1;
end