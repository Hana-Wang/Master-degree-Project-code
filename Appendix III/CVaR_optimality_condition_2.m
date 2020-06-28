function [ output_args ] = CVaR_optimality_condition_2( N,T )
%UNTITLED Summary of this function goes here
% Detailed explanation goes here
%%%another method using the old definition of 'linsolve' by constructing %%%symbolic matrices;;;;however, in the new release version, no definition %%%of solver 'linsolve' for input arguments of type 'sym';; 
%%%Therefore, we use 'solve' iteratively
%%%to deal with input arguments of 'sym' type;;; %%%generating a symbolic vector with n variables xi=[];
for i=1:T-1 
t=sym(['x' int2str(i)],'positive'); 
xi=[xi;t]; 
end 
S=[];
for i=1:N
       t=sym(sum(c(:,i).*xi));
S=[S;t]; 
end 
%%additional parameters,i.e. additional requirement for solution 
adt=sym(sum((Aeq').*xi));
beq=zeros(N,1);
B=[beq;ones];
beq=1
Bt=[];
for i=1:T-1
    Bt=[Bt;zeros(1,T)]
end 
adB=zeros(1,T)
adB(T)=beq;
B=[Bt;adB]
end