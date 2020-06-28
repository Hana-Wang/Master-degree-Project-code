function [ LV ] = difference_sign_test( N,T,alpha ) %DIFFERENCE_SIGN_TEST Summary of this function goes here
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
d=diff(ux); num_diff_positv=numel(find(sign(d)==1)); %%%
crite=norminv(1-alpha/2);
drift=(T-1)/2;
variance=(T+1)/12;
std=sqrt(variance);
if abs(num_diff_positv-drift)/std > crite 
  LV=false(ones);
else 
  LV=true(ones);
end
