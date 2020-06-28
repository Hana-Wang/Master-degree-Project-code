function [ CVaR_I ] = CVaR_asset_I( I,N,T ) %UNTITLED Summary of this function goes here % Detailed explanation goes here risk_envlopI=riskI_envelope( I,N,T ); 
%%%
givePortfoval=portfolio_given(N,T); % an given vector over T periods %%%
CVaR_I=(givePortfoval*(1-risk_envlopI))/T; 
end