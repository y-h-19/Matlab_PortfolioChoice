# Matlab_PortfolioChoice
 Yuna Hahn and Narayani G.
 Spring 2014, CS 112 Project: Portfolio Choice

Our project is a learning tool for understanding the finance concept
related to Risk, Uncertainty and Portfolio Choice. Investors are usually 
risk averse and, while making portfolio choices containing two risky assets
with well defined payoffs and probabilities, need to ascertain how much 
they would be willing to pay to hold that portfolio. How much somebody is 
willing to pay to buy this lottery will vary based on their risk 
preferences, whether they are risk-averse, risk-neutral or risk-taker, and 
how much initial wealth they own. This program will allow users to compare 
either two different investor's choices for a given portfolio or one 
investor's choice for two different portfolios. 

The user will first input an investor's risk preferences-- risk-averse 
(sqrt(y)), risk-neutral (y), or risk-taker (y^2), and the degree of these 
preferences (coefficient). Then they will choose the investor's initial 
wealth (Yo<100,000), the payoffs of the two risky assets (z1 & z2), and 
their respective probabilities (p1& p2, where p1<1; p2 is automatically 
calculated by program).

If the user wants to compare two different investor's choices for a given 
portfolio, then the user should add the second investor's coefficients, 
risk preferences, or initial wealth values in the fields for graph 2 and 
keep the payoffs and probabilities the same. If the user wants to compare 
one investor's choice for two different probabilities, then the user should 
only alter the payoffs and probabilities values in graph 2 and keep the 
risk preferences and initial wealth the same. 

Once the plot button is pressed, the program calculates and displays the 
results values, plots the user's risk preferences, initial wealth, and 
expected payoffs from the risky portfolio. The 'compare results' button 
shows a comparison of the result values for both graphs in the textbox. 
(The comparison is only valid when only either the investors or the 
portfolios are different, not both. Therefore, if in graph1 and graph2 
the user inputs the same information for investors and portfolios or 
different information for both, pressing the 'compare results' button 
will ask them  to have one parameter constant and to vary the other one.)

The results values will give the user the certainty equivalent (CE), which 
is the amount that will make the investor indifferent between holding the 
portfolio and receiving this certain payment (CE). The higher the aversion 
to risk, the lower the CE. Risk premium (pi) is compensation that an 
investor will accept  for the risk taken on by holding the asset instead of 
receiving CE. Ra is the coefficient of absolute risk aversion, which is a 
risk measure independent of initial wealth, and Rr is the coefficient of 
relative risk aversion, which is dependent on initial wealth.  
