function [czescroku,liczbaokresow]=obliczczescrokuiokresy(rodzajkap,jednczasu,dlugosc)
czescroku=0;
liczbaokresow=0;
if jednczasu==1 %miesi¹c
        if rodzajkap==1
            czescroku=(1/12)*dlugosc; 
            liczbaokresow=1.0;
        elseif rodzajkap==2 %miesieczna
            czescroku=1/12;
            liczbaokresow=dlugosc 
        elseif rodzajkap==3 %dzienna
            czescroku=1/365;
            liczbaokresow=30*dlugosc 
        end
elseif jednczasu==2 %dzieñ
        if rodzajkap==1
            czescroku=dlugosc/365;
            liczbaokresow=1.0
        elseif rodzajkap==3 %dzienna
            czescroku=1/365;
            liczbaokresow=dlugosc
        end
elseif jednczasu==3 %rok
        if rodzajkap==1
            czescroku=dlugosc;
            liczbaokresow=1.0
        elseif rodzajkap==2 %miesieczna
            czescroku=1/12;
            liczbaokresow=12*dlugosc 
        elseif rodzajkap==3 %dzienna
            czescroku=1/365;
            liczbaokresow=365*dlugosc 
        else                                         %roczna
            czescroku=1;
            liczbaokresow=dlugosc;
        end
end    