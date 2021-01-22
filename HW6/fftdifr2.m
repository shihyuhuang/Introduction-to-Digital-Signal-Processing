function X = fftdifr2(x)
N=length(x);                       
p=log2(N);
p=ceil(p);
y1=(2^p)-N;
y=zeros(1,y1);
x=[x y];                                            
N=length(x);                                                               
S=log2(N);                                                                  
h=N/2;                                                                   
for k=1:S                                                            
    for in=0:(N/(2^(k-1))):(N-1)                                  
        for n=0:(h-1)                                            
            m=n+in+1;                                                  
            pow=(2^(k-1))*n;                                            
            w=exp(-1j*2*pi*pow/N);                                      
            a=x(m)+x(m+h);                                           
            b=(x(m)-x(m+h)).*w;                                      
            x(m)=a;                                                       
            x(m+h)=b;                                                 
        end
    end
h=h/2;                                                               
end
X=x;                                       
end

