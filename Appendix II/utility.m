function [ output_args ] = utility( I,N,T )
%UTILITY Summary of this function goes here
% I denotes the asset I
ux=portfolio_given(N,T);
alph=zeros(N,T);
bet=zeros(N,T);
alph=alpha(N,T);
bet=beta(N,T);
%%%%% 
y1={0,0,0,0};
z1=zeros(N,T);
for i=2:3
    y1=[y1;{0,0,0,0}];
end
for i=1:N 
for t=1:T y1{i,t}=@(x)bet(i,t)*x+alph(i,t); z1(i,t)=y1{i,t}(ux(t)); 
end end 
uxx=[-0.03,ux];
for i=1:N
   zz1(i)=y1{i,1}(-0.03);
end 
zz=[zz1',z1];
uxi=uxx(1):0.00025:uxx(T+1);
uyi = interp1(uxx,zz(I,:),uxi);
plot(uxx,zz(I,:),'O',uxi,uyi);
end

