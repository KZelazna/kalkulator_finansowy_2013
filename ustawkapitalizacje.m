function rodzokrkap=ustawkapitalizacje(komorka)

if (strcmp('miesi�czna',komorka) || strcmp('miesi�c',komorka))
    rodzokrkap=2;
elseif (strcmp('dzienna',komorka) || strcmp('dzie�',komorka))
    rodzokrkap=3;
elseif (strcmp('roczna',komorka) || strcmp('rok',komorka))
    rodzokrkap=4;
else
    rodzokrkap=1;
end