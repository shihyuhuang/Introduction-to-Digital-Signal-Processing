function x=idtfs0(c)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
N=length(c);
n=[0:1:N-1];
x=zeros(1,N);

for n=0:N-1
    for k=0:N-1
        x(n+1)=x(n+1)+c(k+1)*exp(1i*2*pi*k*n/N);
    end

end

