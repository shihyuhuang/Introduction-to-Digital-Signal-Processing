function X = fftalt8(x)
x1=zeros(1,8);
x2=zeros(1,8);
X=zeros(1,8);

for k=0:3
    x1(k+1)=x(k+1)+x(k+1+4);
end
for k=4:7
    x1(k+1)=x(k+1-4)-x(k+1);
end

for k=0:1
    x2(k+1)=x1(k+1)+x1(k+1+2);
end
for k=2:3
    x2(k+1)=x1(k+1+2)+x1(k+1+4)*exp(2*pi*-1j*2/8);
end
for k=4:5
    x2(k+1)=x1(k+1-4)-x1(k+1-2);
end
for k=6:7
    x2(k+1)=x1(k+1-2)-x1(k+1)*exp(2*pi*-1j*2/8);
end

for k=0:3
    X(k+1)=x2(2*k+1)+x2(2*k+1+1)*exp(2*pi*-1j*k/8);
end
for k=4:7
    X(k+1)=x2(2*(k-4)+1)-x2(2*(k-4)+1+1)*exp(2*pi*-1i*(k-4)/8);
end

end

