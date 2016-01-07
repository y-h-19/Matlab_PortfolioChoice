% Compare function compares results for both graphs when the 'Compare
% Results' button is pressed

% Yuna Hahn. Narayani G.
% CS 112 Project: Portfolio Choice
% Spring 2014


function handles = compare(handles)

% assigning values from handles to variables to be used in result string

ce1 = get(handles.ce1, 'string');
pi1 = get(handles.pi1, 'string');
ra1 = get(handles.ra1, 'string');
rr1 = get(handles.rr1, 'string');

ce2 = get(handles.ce2, 'string');
pi2 = get(handles.pi2, 'string');
ra2 = get(handles.ra2, 'string');
rr2 = get(handles.rr2, 'string');

expz1 = handles.expz1;
expz2 = handles.expz2;

z1 = get(handles.payoff1,'string');
z2 = get(handles.payoff2,'string');
z3 = get(handles.payoff3,'string');
z4 = get(handles.payoff4,'string');

p1 = get(handles.prob1,'string');
p3 = get(handles.prob3,'string');

compareText = cell(1,1);

if strcmp(z1,z3) && strcmp(z2, z4) && strcmp(p1, p3) && (get(handles.coeffMenu1,'Value')==get(handles.coeffMenu2,'Value')) && (get(handles.averseRadioButton1, 'Value')==get(handles.averseRadioButton2, 'Value')) && ((get(handles.neutralRadioButton1, 'Value')==get(handles.neutralRadioButton2, 'Value'))&& (get(handles.takerRadioButton1, 'Value')==get(handles.takerRadioButton2, 'Value')) && (strcmp(get(handles.initialWealth1, 'string'), get(handles.initialWealth2, 'string'))));
    % display message for user to fix values if both user and portfolios are
    % the same
    compareText{1} = sprintf('Please check the information inputted so that either the investors or portfolios are different.');
    set(handles.textBox, 'String', compareText, 'ForegroundColor', 'k');
    
elseif (get(handles.coeffMenu1,'Value')==get(handles.coeffMenu2,'Value')) && (get(handles.averseRadioButton1, 'Value')==get(handles.averseRadioButton2, 'Value')) && ((get(handles.neutralRadioButton1, 'Value')==get(handles.neutralRadioButton2, 'Value'))&& (get(handles.takerRadioButton1, 'Value')==get(handles.takerRadioButton2, 'Value')) && (strcmp(get(handles.initialWealth1, 'string'), get(handles.initialWealth2, 'string'))));
    % check the number of investors
    % if it is the same investor-different portofolios, display the text
    % below
    compareText{1} = sprintf('Results Comparison:\n\nFor this investor the expected value of Portfolio 1 is %1.2f. Based on the risk preferences of this player, for Portfolio 1 he or she will be indifferent between receiving the certainty equivalent (CE) %s and holding this portfolio. %s is the risk premium (pi), which is the compensation for investors who tolerate the extra risk compared to receiving the risk-free certainty equivalent.\n\nFor Portfolio 2, the expected value is %1.2f. The certainty equivalent for this portfolio is %s and the risk premium is %s. \n \nFor this player, %s is the coefficient of absolute risk aversion, which measures the degree of the risk preferences of the user independent of wealth. %s is the coefficient of relative risk aversion, which measures the risk preferences taking initial wealth into account.',...
        expz1, ce1, pi1, expz2, ce2, pi2, ra2, rr2);
    set(handles.textBox, 'String', compareText, 'ForegroundColor', 'k');
    
elseif strcmp(z1,z3) && strcmp(z2, z4) && strcmp(p1, p3) 
    % check if the portfolios are the same
    % if they are the same portfolios-different investor, display the text below
    compareText{1} = sprintf('Results Comparison:\n\nFor this given portfolio, the expected value is %1.2f.\n\nInvestor 1 will be indifferent between receiving the certainty equivalent (CE) %s and holding the portfolio. %s is the risk premium,  which is the compensation for investors who tolerate the extra risk compared to receiving the risk-free certainty equivalent. %s is the coefficient of absolute risk aversion, which measures the degree of the risk preferences of the user independent of wealth. %s is the coefficient of relative risk aversion, which measures the risk preferences taking initial wealth into account.\n\nInvestor 2''s certainty equivalent is %s and risk premium is %s. Their coefficient of absolute risk aversion is %s and coefficient of relative risk aversion is %s.',...
        expz1, ce1, pi1, ra1, rr1, ce2, pi2, ra2, rr2);
    set(handles.textBox, 'String', compareText, 'ForegroundColor', 'k');
    
else
    % display message for user to fix values if both user and portfolios are
    % not the same
    compareText{1} = sprintf('Please check the information inputted so that either the investors or portfolios are different.');
    set(handles.textBox, 'String', compareText, 'ForegroundColor', 'k');
end




