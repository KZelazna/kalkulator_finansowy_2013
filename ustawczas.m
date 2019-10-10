function [dlug, jednczas]=ustawczas(komorka)

    a=komorka;
    [dl,poz]=strtok(a);
    [jednczas,spac]=strtok(poz);
    dlug=str2num(dl);