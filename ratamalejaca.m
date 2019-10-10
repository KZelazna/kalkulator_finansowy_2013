function [wysokoscrat, kwotakoncowa, odsetki]=ratamalejaca(kwota,procent,czasmies)


Rk=kwota/czasmies;

Rzm=[];

for i=1:czasmies
    Rzm(i)=(kwota-((i-1)*Rk))*procent/1200;
end

wysokoscrat=Rk+Rzm;
odsetki=sum(Rzm);
kwotakoncowa=kwota+odsetki;