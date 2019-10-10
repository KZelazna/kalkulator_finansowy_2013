function varargout = oknokredytow(varargin)
% OKNOKREDYTOW MATLAB code for oknokredytow.fig
%      OKNOKREDYTOW, by itself, creates a new OKNOKREDYTOW or raises the existing
%      singleton*.
%
%      H = OKNOKREDYTOW returns the handle to a new OKNOKREDYTOW or the handle to
%      the existing singleton*.
%
%      OKNOKREDYTOW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OKNOKREDYTOW.M with the given input arguments.
%
%      OKNOKREDYTOW('Property','Value',...) creates a new OKNOKREDYTOW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before oknokredytow_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to oknokredytow_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help oknokredytow

% Last Modified by GUIDE v2.5 14-May-2013 16:25:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @oknokredytow_OpeningFcn, ...
                   'gui_OutputFcn',  @oknokredytow_OutputFcn, ...
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


% --- Executes just before oknokredytow is made visible.
function oknokredytow_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to oknokredytow (see VARARGIN)

% Choose default command line output for oknokredytow
handles.output = hObject;
handles.liczbakredytow=0;
handles.danekredytow=cell(20,8);
handles.danezpliku=cell(20,5);
handles.czaslat=10;
handles.opisczasu='10 lat';
handles.czasmies=12*handles.czaslat;
handles.oprocentowanie=10.0;
handles.kwotakredytu=1000;
set(handles.radiobutton1,'Value',1);
set(handles.radiobutton2,'Value',0);
handles.opisraty='sta³a';
handles.wysokoscrat=0;
handles.kwotakoncowa=0;
handles.odsetki=0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes oknokredytow wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = oknokredytow_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
typliczenia()
close(oknokredytow)



function editkwotakred_Callback(hObject, eventdata, handles)
% hObject    handle to editkwotakred (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
kw=get(hObject,'String');
kasa=str2num(kw);
if get(handles.popupmenu1,'Value')==1
handles.kwotakredytu=1000*kasa;
else
    handles.kwotakredytu=kasa;
end
guidata(hObject, handles)
% Hints: get(hObject,'String') returns contents of editkwotakred as text
%        str2double(get(hObject,'String')) returns contents of editkwotakred as a double


% --- Executes during object creation, after setting all properties.
function editkwotakred_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editkwotakred (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.oprocentowanie=get(handles.slider1,'Value');
proctxt=num2str(handles.oprocentowanie);
opr=[proctxt ' %'];
set(handles.txtinfoproc,'String',opr);
guidata(hObject,handles);
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=get(hObject,'String'); 
handles.czaslat=str2num(a);
handles.czasmies=12*str2num(a);
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value')==1
    kw=get(handles.editkwotakred,'String');
    kasa=str2num(kw);
    handles.kwotakredytu=1000*kasa;
else
    kw=get(handles.editkwotakred,'String');
    kasa=str2num(kw);
    handles.kwotakredytu=kasa;
end
guidata(hObject,handles)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in guzikkredyt.
function guzikdodajkredyt_Callback(hObject, eventdata, handles)
% hObject    handle to guzikdodajkredyt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=mod(handles.czaslat,10);

jednczasu=' lat';
if handles.czaslat==1
    jednczasu=' rok';
elseif (a==2 && handles.czaslat~=12) || (a==3 && handles.czaslat~=13) || (a==4 && handles.czaslat~=14)
    jednczasu=' lata';
else
    jednczasu=' lat';
end

if get(handles.radiobutton1,'Value')==get(handles.radiobutton1,'Max')
    [handles.wysokoscrat handles.kwotakoncowa handles.odsetki]=ratastala(handles.kwotakredytu, handles.oprocentowanie, handles.czasmies);
    handles.wysokoscrat=repmat(handles.wysokoscrat,1,handles.czasmies);
    handles.opisraty='sta³a';
    handles.opisczasu=[num2str(handles.czaslat) jednczasu];
else
    [handles.wysokoscrat handles.kwotakoncowa handles.odsetki]=ratamalejaca(handles.kwotakredytu, handles.oprocentowanie, handles.czasmies);
    handles.opisraty='malej¹ca';
    handles.opisczasu=[num2str(handles.czaslat) jednczasu];
end
handles.liczbakredytow=handles.liczbakredytow+1;
handles.danekredytow(handles.liczbakredytow,:)={num2str(handles.liczbakredytow), handles.kwotakredytu, handles.opisczasu, handles.oprocentowanie, handles.opisraty, handles.kwotakoncowa, handles.odsetki, handles.wysokoscrat};

set(handles.uitable1,'Data',handles.danekredytow(:,1:7));

%powrót do wart. poczatk
handles.czaslat=10;
handles.opisczasu=[num2str(handles.czaslat) '' 'lat'];
handles.czasmies=12*handles.czaslat;
handles.oprocentowanie=10.0;
handles.kwotakredytu=1000;
set(handles.radiobutton1,'Value',1);
set(handles.radiobutton2,'Value',0);
handles.opisraty='sta³a';
handles.wysokoscrat=0;
handles.kwotakoncowa=0;
handles.odsetki=0;
set(handles.editkwotakred,'String','');
set(handles.edit2,'String','');
set(handles.popupmenu1,'Value',1);
set(handles.slider1,'Value',10.0);

proctxt=num2str(handles.oprocentowanie);
opr=[proctxt ' %'];
set(handles.txtinfoproc,'String',opr);
guidata(hObject,handles);



% --- Executes on button press in dodajzpliku.
function dodajzpliku_Callback(hObject, eventdata, handles)
% hObject    handle to dodajzpliku (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[nazwapliku,nazwasciezki]=uigetfile({'*.xls;*.xslx','Pliki programu MicrosoftExcel (*.xls, *.xslx)'},'Wybierz plik:');
sciezka=[nazwasciezki,nazwapliku];
[status]=copyfile(sciezka,cd);
plik1=cell(20,5);
plik2=cell(20,5);
plik3=cell(20,5);
[plik1 plik2 plik3]=xlsread(nazwapliku);
a=cat(2,pwd,'\');
if strcmp(nazwasciezki,a)==0
    delete(nazwapliku);
end

b=handles.liczbakredytow+1;
[handles.liczbakredytow,handles.danezpliku]=kredytzpliku(handles.liczbakredytow,plik3);

%do wszystkich danych

for i=b:handles.liczbakredytow
    handles.danekredytow(i,:)=handles.danezpliku(i-b+1,:);
end
set(handles.uitable1,'Data',handles.danekredytow(:,1:7));

guidata(hObject,handles);

% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value')==get(hObject,'Min') %liczy odsetki
    dobarcharta=[];
    
    for i=1:size(handles.danekredytow,1);
        dobarcharta=[dobarcharta handles.danekredytow{i,7}];
    end
    y=[dobarcharta;1:size(dobarcharta,2)];
    bar(y,0.5);
    axis([0.45 1.55 0 (max(dobarcharta)+500)])
    set(handles.igreki,'String','odsetki');
    set(hObject,'String','Raty');
    set(hObject,'tooltipString','Przedstawia wykres wysokoœci kolejnych rat.');

set(handles.legenda,'tooltipString','Kolejne s³upki odpowiadaj¹ kolejnym kredytom wpisanym w tabeli.');
else %liczy raty
    maxrata=[];
    maxczas=[];
    for i=1:size(handles.danekredytow,1)
        [wygrzebczas,wygrzeblata]=strtok(handles.danekredytow{i,3});
        czas=12*str2num(wygrzebczas);
        przedzial=1:czas;
        raty=handles.danekredytow{i,8};
        maxrata=[maxrata max(raty)];
        maxczas=[maxczas czas];
        
        [kolor, linia]=stylwykresu(i);
        plot(przedzial,raty,'Color',kolor,'LineStyle',linia,'LineWidth',2)
        hold all
    end
    iks=max(maxczas);
    igr=1.1*max(maxrata);
    axis([0 iks 0 igr])
    hold off

a=mfilename('fullpath');
a=[a '.m'];
[sciezka,nazwapliku,rozszerzenie]=fileparts(a);
sciezkaobrazka=[sciezka '\' 'legendaratykredytu.png'];
sciezkaobrazu = strrep(['file:/' sciezkaobrazka],'\','/');
pomocobrazu=['<html><center>''<img src = "' sciezkaobrazu '"><br></center></html>'];

set(handles.legenda,'tooltipString',pomocobrazu);
    set(hObject,'tooltipString','<html>Przedstawia wykres wysokoœci odsetek<br>dla poszczególnych kredytów</html>');

    set(handles.igreki,'String','raty');
    set(hObject,'String','Odsetki');
end
guidata(hObject,handles)
% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- Executes on button press in zapisz.
function zapisz_Callback(hObject, eventdata, handles)
% hObject    handle to zapisz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
naglowki={'Lp.', 'Kwota kredytu', 'Czas sp³aty', 'Oprocentowanie', 'Rata', 'Kwota sp³acona', 'Odsetki'};
rozmiar=size(handles.danekredytow,1);
danedozapisu=cell(rozmiar,7);
range=['A2:G',(num2str(rozmiar))];
for i=1:size(handles.danekredytow,1)
    danedozapisu(i,1:7)=handles.danekredytow(i,1:7);
end

[nazwapliku,nazwasciezki]=uiputfile({'*.xls;*.xslx','Pliki programu MicrosoftExcel (*.xls, *.xslx)'},'Wybierz plik:');
sciezka=[nazwasciezki,nazwapliku];

[status]=copyfile(sciezka,cd);

xlswrite(nazwapliku,naglowki,'A1:G1');
xlswrite(nazwapliku,danedozapisu,range);

a=cat(2,pwd,'\');
if strcmp(nazwasciezki,a)==0
    delete(nazwapliku);
end

guidata(hObject,handles);


% --- Executes on button press in przyciskpomocy.
function przyciskpomocy_Callback(hObject, eventdata, handles)
% hObject    handle to przyciskpomocy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
winopen('pomoc.pdf');
guidata(hObject,handles);

% --- Executes when selected object is changed in uipanel2.
function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel2 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function togglebutton1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

set(hObject,'tooltipString','Przedstawia wykres wysokoœci kolejnych rat.');
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function legenda_CreateFcn(hObject, eventdata, handles)
% hObject    handle to legenda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
