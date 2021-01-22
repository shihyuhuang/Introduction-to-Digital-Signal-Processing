function [G,sos]=firdf2fs(h)
N=length(h);
H=fft(h);

if N/2==0
    sos=zeros(N/2,6);
    G=zeros(1,N/2+2);
    sos(1,:)=[1,0,0,1,-1,0];
    sos(2,:)=[1,0,0,1,1,0];
    Hkb=zeros((N-2)/2,3);
    Hka=zeros((N-2)/2,3);
    for k=1:N/2-1
    Hkb(k)=[cos(angle(H(k+1))) -cos(angle(H(k+1))-2*pi*k/N) 0];
    Hka(k)=[1 -2*cos(2*pi*k/N) 1];
    end
    m=2;
    for i=1:N/2-1
        m=m+1;
        sos(m,:)=[Hkb(i,:) Hka(i,:)];    
    end
    G(1)=H(1);
    G(2)=H(N/2+1);
    m=1;
    for i=3:N/2-1
        G3=2*abs(H(i));
        G3=round(G3,4);
        if G3~=0
            m=m+1;
            G(m)=G3;
        end
    end
else
    sos=zeros((N-1)/2,6);
    G=zeros(1,(N-1)/2+1);
    sos(1,:)=[1,0,0,1,-1,0];
    Hkb=zeros((N-1)/2-1,3);
    Hka=zeros((N-1)/2-1,3);
    for k=1:(N-1)/2
    Hkb(k,:)=[cos(angle(H(k+1))) -cos(angle(H(k+1))-2*pi*k/N) 0];
    Hka(k,:)=[1 -2*cos(2*pi*k/N) 1];
    end
    m=1;
    for i=1:(N-1)/2
        m=m+1;
        sos(m,:)=[Hkb(i,:) Hka(i,:)];     
    end
    G(1)=H(1);
    m=1;
    for i=2:(N-1)/2
        G2=2*abs(H(i));
        G2=round(G2,4);
        if G2~=0
            m=m+1;
            G(m)=G2;
        end
    end
end

G=abs(G(1:m));


