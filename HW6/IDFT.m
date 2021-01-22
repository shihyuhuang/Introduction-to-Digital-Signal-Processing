function x = IDFT(X,N)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
X1=fft(X);
x=X1/N;
end

