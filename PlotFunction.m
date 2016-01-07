%  Yuna H., Narayani G.
% CS 112 Project: Portfolio Choice, PlotFunction
% Spring 2014

% The Plot Function uses the user inputs to plot the user's risk
% preferences, initial wealth and expected payoffs from the risky portfolio. 
% This function also calculates the certainty equaivalent (CE), which is 
% the amount that would make an investor indifferent between receiving this
% certain payment and holding the asset. Then it calculates the 
% risk premium (pi), which is compensation that an investor will accept 
% for the risk taken on by holding the asset instead of receiving CE. 
% Finally, this function calculates two measures of risk aversion: 
% coefficient of absolute risk aversion and the coefficient of relative 
% risk aversion, which are independent and dependent of initial wealth, 
% respectively. All of these results are then displayed in the text box.

function handles =  PlotFunction(handles, whichPlot)

if whichPlot == 1 % graph 1
    % c is the coefficient that measures the degree of user's risk
    % preferences
    if get(handles.coeffMenu1,'Value') > 1;
        c = get(handles.coeffMenu1,'Value');
    end
    
    % checking whether user is averse or taker (if not, the user is neutral) 
    averse = get(handles.averseRadioButton1, 'Value');
    taker = get(handles.takerRadioButton1, 'Value');
    
    % Converting user input of initial wealth to a number
    % if no initial wealth is inputted, it is assumed to be 0
    
    if str2double(get(handles.initialWealth1, 'string')) == '';
        initialw = 0;
    else initialw = str2double(get(handles.initialWealth1, 'string'));
    end
    
    %Converting payoffs of the two risky assets in portfolio to numerical
    %values
    z1 = str2double(get(handles.payoff1,'string'));
    z2 = str2double(get(handles.payoff2,'string'));
    
    %Converting probabilities of the two risky assets to numerical values
    p1 = str2double(get(handles.prob1,'string'));
    p2 = 1-p1;
    
    % after p1 is inputted, p2 is calculated and displayed by program
    set(handles.prob2,'string', p2);
    
    % expected value: E(z) = p1*z1 + p2*z2
    % this is what the average value of the payoffs is, weighted by their
    % probabilities
    handles.expz = (p1*z1)+ (p2*z2);
    handles.expz1 = handles.expz; % saving expz for user 1 separately in ...
    % handles structure to be used within the compare function. All other
    % calculations within this function will be done by the generic expz

else % graph2
    if get(handles.coeffMenu2,'Value') > 1;
        c = get(handles.coeffMenu2,'Value');
    end
    averse = get(handles.averseRadioButton2, 'Value');
    taker = get(handles.takerRadioButton2, 'Value');
    
    if str2double(get(handles.initialWealth2, 'string')) == '';
        initialw = 0;
    else initialw = str2double(get(handles.initialWealth2, 'string'));
    end
    
    z1 = str2double(get(handles.payoff3,'string'));
    z2 = str2double(get(handles.payoff4,'string'));
    
    p1 = str2double(get(handles.prob3,'string'));
    p2 = 1-p1;
    set(handles.prob4,'string', p2);
    
    handles.expz = (p1*z1)+ (p2*z2);
    handles.expz2 = handles.expz; %to be used in compare function
    
end

% setting the range for axes
w = 0:initialw+20000;


% Setting axis background color as white
set(gca, 'color', [1 1 1]);

%defining risk preferences, w here refers to wealth (shown on x axis)
r = w;

%defining initial utility given initial wealth (utility is shown on y axis)
initialu = c*initialw;

if averse
    r = w.^(1/2);
    initialu = c*(sqrt(initialw));
elseif taker
    r = w.^2;
    initialu = c*(initialw.^2);
end


% Save plots in a structure so that only the last plot can be undone when
% undo button is called 
if whichPlot == 1
    handles.plots(end+1, 1) = plot(c*r, 'linewidth', 1.2);
else handles.plots(end+1, 1) = plot(c*r, 'm','linewidth', 1.2);
end

hold on;

% plot lines to show initial wealth and its utility
handles.plots(end, 2) = plot([initialw, initialw],[0, initialu], 'g', 'linewidth', 1.2);
handles.plots(end,3) = plot([0, initialw], [initialu, initialu], 'g', 'linewidth', 1.2);


% Adding line to show final wealth including the expected value of payoffs 
% (initialw+expz)
finalwealth = initialw + handles.expz;

% utility of holding the risky asset (U(initialw+expz))
ufinalwealth = c*(finalwealth);

% Expected utility of holding the asset: This is the utility that the user
% will have on average by holding the asset.
% This is lower than utility of Yo+E(z) because of the risk involved.
expufinalwealth = p1*(c*(initialw+z1)) + p2*(c*(initialw+z2));

%Finding the final wealth that will give the expected utility Yo+z from
%previous step (this is different from Yo+expz)
expuwealth = (p1*((initialw+z1)))+(p2*((initialw+z2)));

if averse
    ufinalwealth = c*(sqrt(finalwealth));
    expufinalwealth = p1*(c*(sqrt(initialw+z1))) + p2*(c*(sqrt(initialw+z2)));
    expuwealth = (p1*((sqrt(initialw+z1)))+p2*((sqrt(initialw+z2))))^2;
elseif taker
    ufinalwealth = c*(finalwealth.^2);
    expufinalwealth = p1*(c*((initialw+z1)^2)) + p2*(c*((initialw+z2)^2));
    expuwealth = sqrt((p1*((initialw+z1)^2))+(p2*((initialw+z2))^2));
end

%Plotting Yo+E(z) and its utility. This is final wealth and its utility
%that the user will have on average by holding the asset.

handles.plots(end,4) = plot([finalwealth,finalwealth],[0,ufinalwealth], 'k', 'linewidth', 1.1);
handles.plots(end,5)= plot([0,finalwealth], [ufinalwealth,ufinalwealth], 'k', 'linewidth', 1.1);

%Plotting expected utility of holding asset and the wealth that gives this
%expected utility
handles.plots(end,6) = plot([0, finalwealth], [expufinalwealth,expufinalwealth], 'r--', 'linewidth', 1.1);
handles.plots(end,7) = plot([expuwealth,expuwealth], [0,expufinalwealth],'r--', 'linewidth', 1.1);


% Calculating certainty equivalent (CE) and risk premium (Pi)
% CE is the guaranteed return that will make the investor indifferent
% between holding the risky asset and accepting this certain return (CE)
% Pi is the 'compensation' for investors to tolerate the extra risk
% compared to receiving the certain payment (CE)

handles.ce = expuwealth-initialw;
handles.pi = (finalwealth-initialw)-handles.ce;

% Calcuating Ra and Rr
% Ra is the coefficient of absolute risk aversion, a measure of risk that
% is independent of initial wealth
% Rr is the coefficient of relative risk aversion, another measure of risk,
% but one that is dependent on initial wealth
handles.ra = 0;
handles.rr = 0;

if averse
    handles.ra = '1/2y';
    cof = initialw/2;
    handles.rr = strcat(num2str(cof), '/y');
elseif taker
    handles.ra = '-1/y';
    handles.rr = strcat('-',num2str(initialw), '/y');
end

% Assigning calculated values to result values
if whichPlot == 1
    set(handles.ce1,'string', handles.ce);
    set(handles.pi1,'string', handles.pi);
    set(handles.ra1,'string', handles.ra);
    set(handles.rr1,'string', handles.rr);
else set(handles.ce2,'string', handles.ce);
    set(handles.pi2,'string', handles.pi);
    set(handles.ra2,'string', handles.ra);
    set(handles.rr2,'string', handles.rr);
end

% Setting axis labels
set(get(handles.graph,'XLabel'),'String','wealth', 'FontSize', 12);
set(get(handles.graph,'YLabel'),'String','utility(wealth)', 'FontSize', 12)

end
