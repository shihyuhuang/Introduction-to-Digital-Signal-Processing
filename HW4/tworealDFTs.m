function [X1,X2] = tworealDFTs(x1,x2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
x=x1+1i*x2;

X=fft(x);
xcon=conj(x);
Xcon=fft(xcon);

Xcce=0.5*(X+Xcon);
Xcco=0.5*(X-Xcon);
X1=Xcce;
X2=Xcco/1i;

end

