function [ XX ] = beta( N,T )
%BETA Summary of this function goes here
P = [0.013109444000000 -0.011446755000000 0.014203332000000 - 0.006573504000000; 
-0.006901994000000 -0.016561345000000 0.021431869000000 0.004131142000000; 
0.012556248000000 0.051666835000000 0.026383835000000 - 0.005190110000000];
lamda = optiml_portfolio_mean_varian(N,T);
lamda=lamda'; 
ux=lamda*P(:,1);
for t=2:T
  ux=[ux,lamda*P(:,t)];
end 
ux=sort(ux);
 f=zeros(1,T+1);
 f(1,T+1)=1;
 bet=zeros(N,T+1);
 X=zeros(N,T+1);
 XX=zeros(N,T);
 B=zeros(N,T);
 C=zeros(N,T);
%the solution of linear programming
% the solution of beta
for i=1:N
    for t=1:T
         B(i,t)=  P(i,t)-ux(t);
end end 
for i=1:N
       uB=B(i,:);
       C(i,:)=uB(T:-1:1);
end 
e1=ones(N,1);
e2=ones(T-1,1); ub1=spdiags([-1*e2],1,T-1,T); ub2=spdiags([e2,-1*e2],0:1,T-1,T); z=zeros(T-1,1);
ub1=[ub1,z];
ub2=[ub2,z]; 
%%%%%%%% 
 bet=[C,-1*e1];
 for i=1:N
    A=[bet(i,:);ub1;ub2];
    b=zeros(size(A,1),1);
    Aeq=zeros(1,T+1);
    Aeq(1,1)=1;
    beq=ones(size(Aeq,1),1);
    X(i,:)=linprog(f,A,b,Aeq,beq);
    tmx=X(i,:);
    XX(i,:)=tmx(T:-1:1);
 end