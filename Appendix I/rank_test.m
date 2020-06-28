function [ LV ] = rank_test( N,T,alpha )
%RANK_TEST Summary of this function goes here
% Detailed explanation goes here
P = [0.013109444000000 -0.011446755000000 0.014203332000000 - 0.006573504000000; 
-0.006901994000000 -0.016561345000000 0.021431869000000 0.004131142000000; 
0.012556248000000 0.051666835000000 0.026383835000000 - 0.005190110000000];
r=P';
lamda = optiml_portfolio_mean_varian(N,T); 
lamda=lamda';
ux=lamda*r(1,:)';
for t=2:4
  ux=[ux,lamda*P(:,t)];
end 
%%% 
num_pair_positv=0;
for j=T:-1:2
   dj=ux(j)-ux(1:j-1);
num_pair_positv=num_pair_positv+numel(find(dj>0)); 
end 
%%% 
crite=norminv(1-alpha/2);
drift=T*(T-1)/4;
variance=T*(T-1)*(2*T+5)/8;
std=sqrt(variance);
if abs(num_pair_positv-drift)/std > crite LV=false(ones); 
else 
   LV=true(ones);
end
