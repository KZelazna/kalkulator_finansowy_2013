function varargout = oknolokat(varargin)
% OKNOLOKAT MATLAB code for oknolokat.fig
%      OKNOLOKAT, by itself, creates a new OKNOLOKAT or raises the existing
%      singleton*.
%
%      H = OKNOLOKAT returns the handle to a new OKNOLOKAT or the handle to
%      the existing singleton*. 
%
%      OKNOLOKAT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OKNOLOKAT.M with the given input arguments.
%
%      OKNOLOKAT('Property','Value',...) creates a new OKNOLOKAT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before oknolokat_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to oknolokat_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help oknolokat

% Last Modified by GUIDE v2.5 14-May-2013 16:24:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @oknolokat_OpeningFcn, ...
                   'gui_OutputFcn',  @oknolokat_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before oknolokat is made visible.
function oknolokat_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to oknolokat (see VARARGIN)

% Choose default command line output for oknolokat
handles.output = hObject;
handles.kwotalokaty=1000; %domyœlna kwota lokaty w przypadku niepodania przez u¿ytkownika w³asnej/editkwota
handles.dlugosc=3; %domyœlna d³ugoœæ trwania lokaty w przypadku niepodania przez u¿ytkownika w³asnej/edit3
handles.jednostkaczasu=' miesiêcy'; %domyœlna jednostka czasu dla d³ugoœci trwania lokaty/popupmenu3
handles.oprocentowanie=4; %domyœlne oprocentowanie/slider1/okno procent
handles.liczbalokat=0; %licznik dodanych lokat; maksymalnie 20 
handles.wysokoscpodatku=19; %domyœlna wysokoœæ podatku
handles.czescroku=handles.dlugosc/12;
handles.rodzajokresukapitalizacji=1; %domyœlnie 1 - na koniec okresu. Pozosta³e: 2 - dzienna, 3 - miesiêczna, 4 - roczna
handles.opisokresukapitalizacji='na koniec okresu'; %wyœwietlany opis

handles.liczbaokrkapit=1; %domyœlna liczba okresów kapitalizacji
handles.dane=cell(20,10); %komórka przechowuj¹ca dane lokat - 10 kolumn, 20 wierszy. Potrzebna do wprowadzenia do tabeli info o lokacie, innych ni¿ liczbowe
handles.kwotakoncowa=lokata(1000,4,3,3);
handles.danezpliku=cell(20,10);
handles.symulacjaczasu=0:1/30:120;
set(handles.radiobutton4,'Enable','off');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes oknolokat wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = oknolokat_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in guzikpowrot. 
%POWRÓT DO WYBORU LOKATA/KREDYT
function guzikpowrot_Callback(hObject, eventdata, handles)
% hObject    handle to guzikpowrot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
typliczenia()
close(oknolokat)


%OKNO WPISANIA KWOTY LOKATY
function editkwota_Callback(hObject, eventdata, handles)
% hObject    handle to editkwota (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
k=get(handles.editkwota,'String');
handles.kwotalokaty=str2num(k);

guidata(hObject, handles);

% Hints: get(hObject,'String') returns contents of editkwota as text
%        str2double(get(hObject,'String')) returns contents of editkwota as a double
function axes1_CreateFcn(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function editkwota_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editkwota (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on slider movement.
%SUWAK WYBORU WYSOKOŒCI OPROCENTOWANIA
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.oprocentowanie=get(hObject,'Value');
set(handles.text5,'String',['Oprocentowanie: ' num2str(handles.oprocentowanie) '%']);
guidata(hObject, handles);


% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

%POPUPMENU - WYBÓR JEDNOSTKI CZASU PRZY PODAWANIU D£UGOŒCI TRWANIA LOKATY
% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value')==1
    handles.jednostkaczasu=' miesiêcy';
    set(handles.radiobutton4,'Enable','off');
elseif get(hObject,'Value')==2
    set(handles.radiobutton4,'Enable','off');
    set(handles.radiobutton2,'Enable','off');
    handles.jednostkaczasu=' dni';
else
    set(handles.radiobutton4,'Enable','on');
    set(handles.radiobutton2,'Enable','on');
    handles.jednostkaczasu=' lat';
end
guidata(hObject,handles);


% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%OKNO EDYCJI D£UGOŒCI TRWANIA LOKATY
function editdlugosc_Callback(hObject, eventdata, handles)
% hObject    handle to editdlugosc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
k=get(handles.editdlugosc,'String');
handles.dlugosc=str2num(k);
guidata(hObject,handles);

% Hints: get(hObject,'String') returns contents of editdlugosc as text
%        str2double(get(hObject,'String')) returns contents of editdlugosc as a double


% --- Executes during object creation, after setting all properties.
function editdlugosc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editdlugosc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%GUZIK "DODAJ LOKATE"
% --- Executes on button press in dodajlokate.
function dodajlokate_Callback(hObject, eventdata, handles)
% hObject    handle to dodajlokate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%obliczenie zysków i takich tam
handles.kwotakoncowa=lokata(handles.kwotalokaty,handles.oprocentowanie,handles.czescroku,handles.liczbaokrkapit);
handles.wysokosczysku=zysk(handles.kwotalokaty,handles.kwotakoncowa,handles.wysokoscpodatku);
handles.liczbalokat=handles.liczbalokat+1;

%WYS£ANIE TEGO¯ DO TABELI
handles.dane(handles.liczbalokat,:)={num2str(handles.liczbalokat), handles.kwotalokaty, handles.oprocentowanie, [num2str(handles.dlugosc) handles.jednostkaczasu] handles.opisokresukapitalizacji handles.kwotakoncowa handles.wysokosczysku handles.czescroku handles.liczbaokrkapit handles.wysokoscpodatku};
set(handles.uitable1,'Data',handles.dane(:,1:7));

%powrót do pocz¹tkowych wartoœci w oknie u¿ytkownika - aby klikniêcie
%dodania bez jakiegokolwiek uzupe³nienia dawa³o pocz¹tkowo ustalone,
%domyœlne wartoœci poszczególnych pól.
set(handles.editkwota,'String','');
set(handles.editdlugosc','String','');
set(handles.popupmenu3,'Value',1);

set(handles.slider1,'Value',4.0);
handles.oprocentowanie=4; %domyœlne oprocentowanie/slider1/okno procent
set(handles.radiobutton1,'Value',1);
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton3,'Value',0);
set(handles.radiobutton4,'Value',0);
set(handles.text5,'String',['Oprocentowanie: ' num2str(handles.oprocentowanie) '%']);
handles.kwotalokaty=1000; %domyœlna kwota lokaty w przypadku niepodania przez u¿ytkownika w³asnej/editkwota
handles.dlugosc=3; %domyœlna d³ugoœæ trwania lokaty w przypadku niepodania przez u¿ytkownika w³asnej/edit3
handles.jednostkaczasu=' miesiêcy'; %domyœlna jednostka czasu dla d³ugoœci trwania lokaty/popupmenu3
set(handles.radiobutton4,'Enable','off');
set(handles.radiobutton2,'Enable','on');
set(handles.radiobutton3,'Enable','on');
handles.wysokoscpodatku=19; %domyœlna wysokoœæ podatku
handles.czescroku=handles.dlugosc/12;
handles.rodzajokresukapitalizacji=1; %domyœlnie 1 - na koniec okresu. Pozosta³e: 2 - dzienna, 3 - miesiêczna, 4 - roczna
handles.opisokresukapitalizacji='na koniec okresu'; %wyœwietlany opis

handles.liczbaokrkapit=1; %domyœlna liczba okresów kapitalizacji

guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% --------------------------------------------------------------------
function uipanel2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%WYBÓR OKRESU KAPITALIZACJI - na koniec, miesiêczna, dzienna, roczna
% --- Executes when selected object is changed in uipanel2.
function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel2 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

%Opis okresu kapitalizacji...
if (get(handles.radiobutton1,'Value')==get(handles.radiobutton1,'Max'))
    handles.rodzajokresukapitalizacji=1;
    handles.opisokresukapitalizacji='na koniec okresu';
elseif (get(handles.radiobutton2,'Value')==get(handles.radiobutton2,'Max'))
    handles.rodzajokresukapitalizacji=2; 
    handles.opisokresukapitalizacji='miesiêczna';
elseif (get(handles.radiobutton3,'Value')==get(handles.radiobutton3,'Max'))
    handles.rodzajokresukapitalizacji=3;
    handles.opisokresukapitalizacji='dzienna';
else
    handles.rodzajokresukapitalizacji=4;
    handles.opisokresukapitalizacji='roczna';
end


if get(handles.popupmenu3,'Value')==1 %miesi¹c

        if handles.rodzajokresukapitalizacji==1
            handles.czescroku=(1/12)*str2num(get(handles.editdlugosc,'String')); 
            handles.liczbaokrkapit=1.0;

        elseif handles.rodzajokresukapitalizacji==2 %miesieczna
            handles.czescroku=1/12;
            handles.liczbaokrkapit=handles.dlugosc; 
        elseif handles.rodzajokresukapitalizacji==3 %dzienna
            handles.czescroku=1/365;
            handles.liczbaokrkapit=30*handles.dlugosc;  
        end
elseif get(handles.popupmenu3,'Value')==2 %dzieñ
        if handles.rodzajokresukapitalizacji==1
            handles.czescroku=str2num(get(handles.editdlugosc,'String'))/365;
            handles.liczbaokrkapit=1.0;
        elseif handles.rodzajokresukapitalizacji==3 %dzienna
            handles.czescroku=1/365;
            handles.liczbaokrkapit=handles.dlugosc; 
        end
elseif get(handles.popupmenu3,'Value')==3 %rok
        if handles.rodzajokresukapitalizacji==1
            handles.czescroku=str2num(get(handles.editdlugosc,'String'));
            handles.liczbaokrkapit=1.0;
        elseif handles.rodzajokresukapitalizacji==2 %miesieczna
            handles.czescroku=1/12;
            handles.liczbaokrkapit=12*handles.dlugosc; 
        elseif handles.rodzajokresukapitalizacji==3 %dzienna
            handles.czescroku=1/365;
            handles.liczbaokrkapit=365*handles.dlugosc; 
        else                                         %roczna
            handles.czescroku=1;
            handles.liczbaokrkapit=handles.dlugosc; 
        end
end    

guidata(hObject,handles);


%OKIENKO EDYCJI WYSOKOŒCI OPODATKOWANIA
function editpodatek_Callback(hObject, eventdata, handles)
% hObject    handle to editpodatek (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pod=get(handles.editpodatek,'String');
handles.wysokoscpodatku=str2num(pod);
% Hints: get(hObject,'String') returns contents of editpodatek as text
%        str2double(get(hObject,'String')) returns contents of editpodatek as a double
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function editpodatek_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editpodatek (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%tworzenie wykresu

kom=cell(13,20);
for i=1:10
    for j=1:20
        kom{i,j}=handles.dane{j,i};
    end
end


for i=1:20    
    if strcmp(kom{5,i},'na koniec okresu')
        czesciroku=(1/12).*handles.symulacjaczasu; %powinna wyjœæ macierz 1x1081
        liczbaokresow=1;
        kom{12,i}=handles.symulacjaczasu;
        kom{11,i}=lokata(kom{2,i},kom{3,i},czesciroku,liczbaokresow);
        kom{13,i}=zysk(kom{2,i},kom{11,i},kom{10,i});
    elseif strcmp(kom{5,i},'miesiêczna')
        czesciroku=repmat((1/12),1,size(handles.symulacjaczasu,2)); %przez 12 bo np. 36/12 to 3 czêœci roku, i jeszcze raz /12 bo ka¿dy okres oprocentowania jest 1/12 roku
        okresy=czesciroku>0;
        liczbaokresow=floor((cumsum(okresy)/30));
        kom{12,i}=handles.symulacjaczasu;
        kom{11,i}=lokata(kom{2,i},kom{3,i},czesciroku,liczbaokresow);
        kom{13,i}=zysk(kom{2,i},kom{11,i},kom{10,i});
    elseif strcmp(kom{5,i},'dzienna')
        czesciroku=repmat((1/365),1,size(handles.symulacjaczasu,2));
        okresy=czesciroku>0;
        liczbaokresow=cumsum(okresy);
        kom{12,i}=handles.symulacjaczasu;
        kom{11,i}=lokata(kom{2,i},kom{3,i},czesciroku,liczbaokresow);
        kom{13,i}=zysk(kom{2,i},kom{11,i},kom{10,i});
    elseif strcmp(kom{5,i},'roczna')
        czesciroku=repmat(1,1,size(handles.symulacjaczasu,2));
        okresy=czesciroku>0;
        liczbaokresow=floor(cumsum(okresy)/365);
        kom{12,i}=handles.symulacjaczasu;
        kom{11,i}=lokata(kom{2,i},kom{3,i},czesciroku,liczbaokresow);
        kom{13,i}=zysk(kom{2,i},kom{11,i},kom{10,i});
    else
        break;
    end
end

pomocniczy1=kom(~cellfun(@isempty,kom));

pomocniczy2=cell(13,size(pomocniczy1,1)/13);
dowpis=1;
for i=1:size(pomocniczy1,1)
   a=0;
    if mod(i,13)==0
       a=13;
    else
        a=mod(i,13);
   end
    pomocniczy2{a,dowpis}=pomocniczy1{i,1};
    if mod(i,13)==0
      dowpis=dowpis+1;  
    end
   
end
clear dowpis;

for i=1:size(pomocniczy2,2)
[kolor linia]=stylwykresu(i);
plot(pomocniczy2{12,i},pomocniczy2{13,i},'LineWidth',2,'Color',kolor,'Linestyle',linia);
hold all
end
hold off
guidata(hObject,handles);



% --- Executes on button press in przyciskpomocy.
function przyciskpomocy_Callback(hObject, eventdata, handles)
% hObject    handle to przyciskpomocy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
winopen('pomoc.pdf');
guidata(hObject,handles)

%pobranie z pliku
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[nazwapliku,nazwasciezki]=uigetfile({'*.xls;*.xslx','Pliki programu MicrosoftExcel (*.xls, *.xslx)'},'Wybierz plik:');
sciezka=[nazwasciezki,nazwapliku];
[status]=copyfile(sciezka,cd);
plik1=cell(20,10);
plik2=cell(20,10);
plik3=cell(20,10);
[plik1 plik2 plik3]=xlsread(nazwapliku);
a=cat(2,pwd,'\');
if strcmp(nazwasciezki,a)==0
    delete(nazwapliku);
end

b=handles.liczbalokat+1;
[handles.liczbalokat,handles.danezpliku]=lokatyzpliku(handles.liczbalokat,plik3);

for i=b:handles.liczbalokat
    handles.dane(i,:)=handles.danezpliku(i-b+1,:);
end
set(handles.uitable1,'Data',handles.dane(:,1:7));
guidata(hObject,handles);


% --- Executes on button press in przyciskzapisdopliku.
function przyciskzapisdopliku_Callback(hObject, eventdata, handles)
% hObject    handle to przyciskzapisdopliku (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
naglowki={'Lp.', 'Kwota pocz¹tkowa', 'Oprocentowanie', 'Okres', 'Kapitalizacja', 'Kwota koñcowa', 'Zysk', 'Podatek'};
rozmiar=size(handles.dane,1);
danedozapisu=cell(rozmiar,8);
range=['A2:H',(num2str(rozmiar+1))];
for i=1:size(handles.dane,1)
    danedozapisu(i,1:7)=handles.dane(i,1:7);
    danedozapisu{i,8}=handles.dane{i,10};
end

[nazwapliku,nazwasciezki]=uiputfile({'*.xls;*.xslx','Pliki programu MicrosoftExcel (*.xls, *.xslx)'},'Wybierz plik:');
sciezka=[nazwasciezki,nazwapliku];

[status]=copyfile(sciezka,cd);

xlswrite(nazwapliku,naglowki,'A1:H1');
xlswrite(nazwapliku,danedozapisu,range);

a=cat(2,pwd,'\');
if strcmp(nazwasciezki,a)==0
    delete(nazwapliku);
end

guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function pushbutton6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
a=mfilename('fullpath');
a=[a '.m'];
[sciezka,nazwapliku,rozszerzenie]=fileparts(a);
sciezkaobrazka=[sciezka '\' 'legendalokaty.png'];
sciezkaobrazu = strrep(['file:/' sciezkaobrazka],'\','/');
pomocobrazu=['<html><justyfy>' 'Przedstawia symulowany zysk przy podanej<br>pocz¹tkowej kwocie, oprocentowaniu i rodzaju kapitalizacji,<br>w zale¿noœci od czasu trwania. Symulacja jest prowadzona<br>dla okresu 10 lat.' '</justyfy><br><img src = "' sciezkaobrazu '"><br></center></html>'];

set(hObject,'tooltipString',pomocobrazu);
guidata(hObject,handles);
