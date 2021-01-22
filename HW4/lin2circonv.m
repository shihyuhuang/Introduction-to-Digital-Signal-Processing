function [y] = lin2circonv(x,h)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
N1=length(x);
N2=length(h);
N=max(N1,N2);
y1=conv(x,h);
y=zeros(1,N);

y1=[y1,zeros(1,N*N+N)];

for n=0:N-1
    for l=0:N-1
        y(n+1)=y(n+1)+y1(n+1+l*N); 
    end   
end

end


