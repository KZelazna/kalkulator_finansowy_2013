function [wysokoscraty kwotakoncowa odsetki]=ratastala(kwota,procent,czasmies)


q=(1+procent/1200);

wysokoscraty=kwota*((q^czasmies)*(q-1))/((q^czasmies)-1);
kwotakoncowa=czasmies*wysokoscraty;
odsetki=kwotakoncowa-kwota;