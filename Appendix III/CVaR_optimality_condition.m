function [ XV ] = CVaR_optimality_condition( N,T )
%OPTIMALITY_CONDITION Summary of this function goes here
% Detailed explanation goes here
c=Mix_CVaR_coeff( N,T); %% the matrix used for calculate independent variables xi
C=c;
d=zeros(T-1,1);
Aeq=ones(1,T-1);
beq=1;
lb=zeros(T-1,1);
ub=ones(T-1,1);
%%using 'linsolve' _Solve linear system of equations given in matrix form %%[X,R] = linsolve(A,B);
X = lsqlin(C,d,[],[],Aeq,beq,lb,ub); 
K_index=find(X>=0);
XV=[];
for i=1:numel(K_index)
     t=K_index(i);
XV=[XV,X(t)]; %% or use command XV(i)=X(t);;; end 
%%%another method using the old definition of 'linsolve' by constructing %%%symbolic matrices;;;;however, in the new release version, no definition %%%of solver 'linsolve' for input arguments of type 'sym';;
%%%Therefore, we use 'solve' iteratively ,see another m_file;;;; 
end