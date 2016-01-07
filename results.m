% Yuna Hahn, Narayani G.
% CS 112 Project: Portfolio Choice
% Spring 2014

% Results function displays results in text box for either graph when
% the 'Plot Graph' button is pressed

function handles = results(handles, whichPlot)

% saving user inputs as variables to be used in the print command

if whichPlot == 1
    % if the first plot is being called
    expz = handles.expz;
    ce = get(handles.ce1, 'string');
    pi = get(handles.pi1, 'string');
    ra = get(handles.ra1, 'string');
    rr = get(handles.rr1, 'string');
else
    %the second plot is being called
    expz = handles.expz;
    ce = get(handles.ce2, 'string');
    pi = get(handles.pi2, 'string');
    ra = get(handles.ra2, 'string');
    rr = get(handles.rr2, 'string');
end

% create cell array to print strings in results summary
resultText = cell(1,1); 
resultText{1} = sprintf('Results Summary:\n\nThe expected value of the portfolio is %1.2f. Based on the risk preferences of this player, he or she will be indifferent between receiving the certainty equivalent (CE) %s and holding the portfolio. %s is the risk premium (pi), which is the compensation for investors who tolerate the extra risk compared to receiving the risk-free certainty equivalent. \n \n%s is the coefficient of absolute risk aversion, which measures the degree of risk preferences of the user independent of wealth. %s is the coefficient of relative risk aversion, which measures the risk preferences taking initial wealth into account.',...
    expz, ce, pi, ra, rr);

%sets the color of the text based on which graph is being plotted
if whichPlot == 1
    set(handles.textBox, 'String', resultText, 'ForegroundColor', 'b');
else set(handles.textBox, 'String', resultText, 'ForegroundColor', 'm');
end

end


