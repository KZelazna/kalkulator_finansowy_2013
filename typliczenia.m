function varargout = typliczenia(varargin)
% TYPLICZENIA MATLAB code for typliczenia.fig
%      TYPLICZENIA, by itself, creates a new TYPLICZENIA or raises the existing
%      singleton*.
%
%      H = TYPLICZENIA returns the handle to a new TYPLICZENIA or the handle to
%      the existing singleton*.
%
%      TYPLICZENIA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TYPLICZENIA.M with the given input arguments.
%
%      TYPLICZENIA('Property','Value',...) creates a new TYPLICZENIA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before typliczenia_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to typliczenia_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help typliczenia

% Last Modified by GUIDE v2.5 12-May-2013 22:18:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @typliczenia_OpeningFcn, ...
                   'gui_OutputFcn',  @typliczenia_OutputFcn, ...
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


% --- Executes just before typliczenia is made visible.
function typliczenia_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to typliczenia (see VARARGIN)

% Choose default command line output for typliczenia
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes typliczenia wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = typliczenia_OutputFcn(hObject, eventdata, handles) 
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

oknolokat() %otwiera okno lokat
close(typliczenia)



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

oknokredytow() %otwiera okno kredytow
close(typliczenia)
