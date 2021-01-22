function c = dtfs0(x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
N=length(x);
n=[0:1:N-1];
c=zeros(1,N);

for k=0:N-1
    for n=0:N-1
        a=exp(-1i*2*pi*n*k/N);
        c(k+1)=c(k+1)+x(n+1)*a;
       
    end
    c(k+1)=c(k+1)/ N;
      
end
end



