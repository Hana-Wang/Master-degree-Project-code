function [ G,I_lamda ] = risk_profile( N,T )
%RISK_PROFILE Summary of this function goes here
% Detailed explanation goes here
%%desired return;; % risk_free fixed saving account interest rate %%choose fixed saving rate 2.03% for one year, we need weekly rate;; rfm=0.0203; % interest rate for one year
rfm=(rfm+1)^(7/365)-1 ; % weekly risk_free interst rate chosen
%%%
lamda=CVaR_optimality_condition( N,T ); 
% an given vector over T periods
num_lamda=numel(lamda); h=1/(num_lamda-1);
alpha=0:h:1;
%%% %givePortfoval=portfolio_given(N,T); %%% 
g(1)=0; 
      us=lamda./alpha;
  for i=2:num_lamda
% an given vector over T periods
%%% 
      s1=sum(lamda(1:i));
      ai=alpha(i);
      s2=ai*sum(us(i:num_lamda));
      g(i)=s1+s2-ai;
end 
      g(num_lamda)=0;
  xi = 0:.025:1;
  yi = interp1(alpha,g,xi);
  plot(alpha,g,'o',xi,yi);
end