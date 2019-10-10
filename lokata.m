function koncowa=lokata(kwota,procent,czescroku,liczbaokresow)
oproc=procent/100;
wspolczynnik=oproc.*czescroku;
koncowa=kwota.*((1+wspolczynnik).^liczbaokresow);
