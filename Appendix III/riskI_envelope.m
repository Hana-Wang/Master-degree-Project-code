function [ xI ] = riskI_envelope( I,N,T ) %RISK_I_ENVELOPE Summary of this function goes here %%%
mean_return=mean_returnOfobservation(N,I);
%%%
givePortfoval=portfolio_given(N,T); % an mean_givenPortfoval=mean(givePortfoval);
%%%
nAssets=numel(mean_return); 
%%%parameters
apha=[];
for i=1:T-1        %% here, T-1=N ,denotes
given vector over T periods
the number of assets
       apha=[apha,i/T];
end 
aphI=apha(I);
%%%
%%% optimization using linear programming solver f=givePortfoval;
Aeq=ones(1,T);
beq=1;
lb=zeros(T,1);
ub=(1/aphI)*ones(T,1);
[xI, fval]=linprog(f,[],[],Aeq,beq,lb,ub);
end