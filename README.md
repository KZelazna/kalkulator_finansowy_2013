## Projekt studencki z wykorzystaniem Matlaba (wraz z tworzonym w nim GUI). Luty-maj 2013.
## Student project using Matlab (and its GUI). February-May 2013.


### Cel

Celem istnienia programu jest umożliwienie użytkownikowi wykonanie obliczeń związanych z lokatami i kredytami.

### Budowa programu

Program składa się z dwóch podprogramów-trybów pracy: lokat i kredytów. Każda część, jak również okno startowe (wybór trybu), stanowi oddzielny zespół danych, niezwiązanych ze sobą. Przejście do innego okna zamyka poprzednie, usuwając jednocześnie z pamięci dane (niezapisane w pliku). 

### Zewnętrzne dane

Komunikacja z zewnętrznymi danymi polega na pobieraniu/zapisywaniu z/do plików Microsoft Excel (.xls). W programach działających w systemie Windows możliwe jest również otwarcie pliku Pomocy, jeżeli na komputerze jest zainstalowany program odczytujący pliku .pdf (Adobe Reader).

### System i język

Program został napisany w języku Matlab, w systemie operacyjnym Windows 7. Planowane jest przeprowadzenie testów (po poprawieniu składni) dla języka GNU Octave oraz (po uzupełnieniu brakujących funkcji, np. odpowiednika winopen) w systemie Linux.

### Funkcje

Program korzysta przede wszystkim z wbudowanych funkcji pakietu Matlab R2012a. Funkcje obliczające specyficzne wartości (takie jak np. końcowy zysk z lokaty, odsetki od kredytu itp.) zostały utworzone dla potrzeb programu, podobnie jak funkcje przetwarzające niektóre dane w celu umożliwienia korzystania z nich w prawidłowy sposób innym częściom programu.

### Interfejs graficzny

Graficzny interfejs użytkownika został utworzony za pomocą kreatora GUIDE. Planowane jest takie ustawienie wymiarów okna i poszczególnych jego elementów, aby dla każdej rozdzielczości ekranu zajmowały one taką samą część programu i były proporcjonalne.




