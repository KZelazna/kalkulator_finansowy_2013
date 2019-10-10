function kasa=zysk(kwota,koncowa,podatek)

kasa=(koncowa-kwota).*(1-podatek/100);