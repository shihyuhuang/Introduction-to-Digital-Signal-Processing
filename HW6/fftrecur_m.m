function X = fftrecur_m(x,W)
N = length(x);
s=size(W);
N1=s(1);

if N ==1
  X = x;
else
     m = N/2;
     XE = fftrecur_m(x(1:2:N),W);
     XO = fftrecur_m(x(2:2:N),W);
     W = W(1:m,2).^(N1/N);
     temp = W.*XO;
     X = [ XE+temp ; XE-temp ];
end
end
