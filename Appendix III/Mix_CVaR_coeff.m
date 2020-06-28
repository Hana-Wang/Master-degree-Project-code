function [ c ] = Mix_CVaR_coeff( N,T ) %MIX_CVAR_COEFF Summary of this function goes here % Detailed explanation goes here
%%%
mean_return=mean_returnOfobservation( N,T); 
%%minimum desired return;; % risk_free fixed saving account interest rate %%choose fixed saving rate 2.03% for one year, we need weekly rate;; rfm=0.0203; % interest rate for one year 
rfm=(rfm+1)^(7/365)-1 ; % weekly risk_free interst rate chosen %%%
r0=0;
%CVaR_I=CVaR_asset_I( I,N,T ); 
%%%
%%%
givePortfoval=portfolio_given(N,T); mean_givenPortfoval=mean(givePortfoval); %%%
%cova=Covar_asset_I( I,N,T )
%%%
for j=1:N 
for i=1:T-1
cova=Covar_asset_I(i,j,N,T );
CVaR_I=CVaR_asset_I( i,N,T ); c(i,j)=(mean_return(j)-r0)*CVaR_I+(mean_givenPortfoval-r0)*cova; 
end 
end