% Narayani G., Yuna H.
% CS 112 Project: Portfolio Choice
% Spring 2014


function varargout = portfolioChoice(varargin)
%PORTFOLIOCHOICE M-file for portfolioChoice.fig
%      PORTFOLIOCHOICE, by itself, creates a new PORTFOLIOCHOICE or raises the existing
%      singleton*.
%
%      H = PORTFOLIOCHOICE returns the handle to a new PORTFOLIOCHOICE or the handle to
%      the existing singleton*.
%
%      PORTFOLIOCHOICE('Property','Value',...) creates a new PORTFOLIOCHOICE using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to portfolioChoice_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      PORTFOLIOCHOICE('CALLBACK') and PORTFOLIOCHOICE('CALLBACK',hObject,...) call the
%      local function named CALLBACK in PORTFOLIOCHOICE.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help portfolioChoice

% Last Modified by GUIDE v2.5 06-May-2014 16:00:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @portfolioChoice_OpeningFcn, ...
    'gui_OutputFcn',  @portfolioChoice_OutputFcn, ...
    'gui_LayoutFcn',  [], ...
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


% --- Executes just before portfolioChoice is made visible.
function portfolioChoice_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for portfolioChoice
handles.output = hObject;

% creating handles to save information on plots
handles.plots = [];
handles.plot1 = 0;
handles.plot2 = 0;
handles.where =[];

% Loading in and reading user information in the text box
fid = fopen('portfolioChoiceText.txt');
infoText = textscan(fid, '%s', 'delimiter', '\n');
set(handles.textBox, 'string', infoText{1});
fclose(fid);
set(handles.graph,'visible','off')

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes portfolioChoice wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = portfolioChoice_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in coeffMenu1.
function coeffMenu1_Callback(hObject, eventdata, handles)
% hObject    handle to coeffMenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns coeffMenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from coeffMenu1


% --- Executes during object creation, after setting all properties.
function coeffMenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to coeffMenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function initialWealth1_Callback(hObject, eventdata, handles)
% hObject    handle to initialWealth1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initialWealth1 as text
%        str2double(get(hObject,'String')) returns contents of initialWealth1 as a double

%handles.initialWealth1 = str2double(get(hObject, 'string'));

% --- Executes during object creation, after setting all properties.
function initialWealth1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initialWealth1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function payoff1_Callback(hObject, eventdata, handles)
% hObject    handle to payoff1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of payoff1 as text
%        str2double(get(hObject,'String')) returns contents of payoff1 as a double

% calls the payoff1 string value
%handles.payoff1 = str2double(get(hObject, 'string'));
% --- Executes during object creation, after setting all properties.

function payoff1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to payoff1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function payoff2_Callback(hObject, eventdata, handles)
% hObject    handle to payoff2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of payoff2 as text
%        str2double(get(hObject,'String')) returns contents of payoff2 as a double


% --- Executes during object creation, after setting all properties.
function payoff2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to payoff2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function prob1_Callback(hObject, eventdata, handles)
% hObject    handle to prob1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of prob1 as text
%        str2double(get(hObject,'String')) returns contents of prob1 as a double


% --- Executes during object creation, after setting all properties.
function prob1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to prob1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function prob2_Callback(hObject, eventdata, handles)
% hObject    handle to prob2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of prob2 as text
%        str2double(get(hObject,'String')) returns contents of prob2 as a double


% --- Executes during object creation, after setting all properties.
function prob2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to prob2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in plotButton1.
function plotButton1_Callback(hObject, eventdata, handles)
% hObject    handle to plotButton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%calling the PlotFunction
handles = PlotFunction(handles, 1);
set(handles.graph,'visible','on')

% calling the results function
handles = results(handles, 1);

% adding values to handles.plot1 and handles.where so we can use these 
% to compare results or undo result values
handles.plot1 = 1;
handles.where(end+1) = 1;

%enabling the compare results button if plot2 has also been called
if (handles.plot1==1) && (handles.plot2==1)
    set(handles.compareButton,'Enable','on');
end

%adding a legend based on which graph has been called
if handles.plot1 == 1 && handles.plot2 == 1;
    legend([handles.plots(end,1) handles.plots(end-1,1) handles.plots(end,3) handles.plots(end,5) handles.plots(end,7)],{'utility function', 'utility function', 'initial wealth (Y_0)', 'Y_0+expected value of portfolio','expected utility of holding asset'}, 'location', 'SouthOutside')
elseif handles.plot1==1 && handles.plot2==0
     legend([handles.plots(end,1) handles.plots(end,3) handles.plots(end,5) handles.plots(end,7)],{'utility function', 'initial wealth (Y_0)', 'Y_0+expected value of portfolio','expected utility of holding asset'}, 'location', 'SouthOutside')
elseif handles.plot1==0 && handles.plot2==1
    legend([handles.plots(end,1) handles.plots(end,3) handles.plots(end,5) handles.plots(end,7)],{'utility function', 'initial wealth (Y_0)', 'Y_0+expected value of portfolio','expected utility of holding asset'}, 'location', 'SouthOutside')
end

%updates the handles structure
guidata(hObject, handles);


% --- Executes on button press in undoButton.
function undoButton_Callback(hObject, eventdata, handles)
% hObject    handle to undoButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%Undoes the last set of lines that were plotted
if size(handles.plots,1) > 0
    delete(handles.plots(end,:));
    handles.plots(end,:)= [];
    guidata(hObject,handles); %updates the handles structure
end

% updating handles.plot1 and handles.plot2 to default values
if handles.where(1:end) == 1
    handles.plot1=0;
else handles.plot2=0;
end
    
%Calling undoFunction to remove result values and result summary
handles = undoFunction(handles);

%removing last value from handles.where
handles.where = handles.where(1:end-1);

%setting compare results button to disable when undo is called
set(handles.compareButton,'Enable','off');

% Update handles structure
guidata(hObject, handles);



function textBox_Callback(hObject, eventdata, handles)
% hObject    handle to textBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textBox as text
%        str2double(get(hObject,'String')) returns contents of textBox as a double


% --- Executes during object creation, after setting all properties.
function textBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in closeButton.
function closeButton_Callback(hObject, eventdata, handles)
% hObject    handle to closeButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;


% --- Executes on selection change in coeffMenu2.
function coeffMenu2_Callback(hObject, eventdata, handles)
% hObject    handle to coeffMenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns coeffMenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from coeffMenu2


% --- Executes during object creation, after setting all properties.
function coeffMenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to coeffMenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function initialWealth2_Callback(hObject, eventdata, handles)
% hObject    handle to initialWealth2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initialWealth2 as text
%        str2double(get(hObject,'String')) returns contents of initialWealth2 as a double


% --- Executes during object creation, after setting all properties.
function initialWealth2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initialWealth2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function payoff3_Callback(hObject, eventdata, handles)
% hObject    handle to payoff3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of payoff3 as text
%        str2double(get(hObject,'String')) returns contents of payoff3 as a double


% --- Executes during object creation, after setting all properties.
function payoff3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to payoff3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function payoff4_Callback(hObject, eventdata, handles)
% hObject    handle to payoff4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of payoff4 as text
%        str2double(get(hObject,'String')) returns contents of payoff4 as a double


% --- Executes during object creation, after setting all properties.
function payoff4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to payoff4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function prob3_Callback(hObject, eventdata, handles)
% hObject    handle to prob3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of prob3 as text
%        str2double(get(hObject,'String')) returns contents of prob3 as a double


% --- Executes during object creation, after setting all properties.
function prob3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to prob3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in plotButton2.
function plotButton2_Callback(hObject, eventdata, handles)
% hObject    handle to plotButton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%calling the PlotFunction
handles = PlotFunction(handles, 2);
set(handles.graph,'visible','on')

% calling the results function
handles = results(handles, 2);

% adding values to handles.plot2 and handles.where so we can use these 
% to compare results or undo result values
handles.plot2 = 1;
handles.where(end+1) = 2;

% enabling the compare results button if plot1 has also been called
if (handles.plot1==1) && (handles.plot2==1)
    set(handles.compareButton,'Enable','on');
end

%adding a legend based on which graph has been called
if handles.plot1 == 1 && handles.plot2 == 1;
    legend([handles.plots(end,1) handles.plots(end-1,1) handles.plots(end,3) handles.plots(end,5) handles.plots(end,7)],{'utility function', 'utility function', 'initial wealth (Y_0)', 'Y_0+expected value of portfolio','expected utility of holding asset'}, 'location', 'SouthOutside')
elseif handles.plot1==1 && handles.plot2==0
     legend([handles.plots(end,1) handles.plots(end,3) handles.plots(end,5) handles.plots(end,7)],{'utility function', 'initial wealth (Y_0)', 'Y_0+expected value of portfolio','expected utility of holding asset'}, 'location', 'SouthOutside')
elseif handles.plot1==0 && handles.plot2==1
    legend([handles.plots(end,1) handles.plots(end,3) handles.plots(end,5) handles.plots(end,7)],{'utility function', 'initial wealth (Y_0)', 'Y_0+expected value of portfolio','expected utility of holding asset'}, 'location', 'SouthOutside')
end

%updates the handles structure
guidata(hObject, handles);

% --- Executes on button press in compareButton.
function compareButton_Callback(hObject, eventdata, handles)
% hObject    handle to compareButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = compare(handles);
