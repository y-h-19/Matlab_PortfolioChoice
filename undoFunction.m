
% Narayani G., Yuna Hahn
% CS 112 Project: Portfolio Choice
% Spring 2014

% The undoFunction undoes the result values and the result text when the
% 'Undo' button is pressed

function handles = undoFunction(handles)

% setting result values for the relevant graph to an empty string when
% undo is pressed
if handles.where(end) == 1
    set(handles.ce1, 'string', '');
    set(handles.pi1, 'string', '');
    set(handles.ra1, 'string', '');
    set(handles.rr1, 'string', '');
elseif handles.where(end) == 2
    set(handles.ce2, 'string', '');
    set(handles.pi2, 'string', '');
    set(handles.ra2, 'string', '');
    set(handles.rr2, 'string', '');
end

% setting textBox to an empty string when undo is pressed
set(handles.textBox, 'string', '');

