function [ alph ] = alpha( N,T)
%ALPHA Summary of this function goes here
ux=portfolio_given(N,T);
alph=zeros(N,T);
sum=zeros(N,T-1);
xx=beta(N,T);
for i=1:N
  for s=1:(T-1)
     for j=s:(T-1)
sum(i,s)=(xx(i,j+1)-xx(i,j))*ux(j)+sum(i,s); 
end end 
end 
alph_T=zeros(N,1);
sum=[sum,alph_T];
alph=sum;
end
