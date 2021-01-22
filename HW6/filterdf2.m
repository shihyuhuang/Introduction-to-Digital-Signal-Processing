function y=filterdf2(b,a,x)
N=length(a)-1;
M=length(b)-1;
K=max(N,M);
L=length(x);
y=zeros(1,L);
w=zeros(1,L);
 
if N>M
    b=[b' zeros(1,N-M)]';
else
    a=[a' zeros(1,M-N)]';
end
 
for n=0:L-1
    for k=1:K
        if n-k<0
            ch=0;
        else
            ch=w(n-k+1);
        end
        w(n+1)=w(n+1)+-a(k+1)*ch;
    end
    w(n+1)=w(n+1)+x(n+1);
    for k=0:K
        if n-k<0
            ch=0;
        else
            ch=w(n-k+1);
        end
        y(n+1)=y(n+1)+b(k+1)*ch;
    end
end
end
