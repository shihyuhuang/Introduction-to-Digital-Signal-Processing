function y = filterfirlp(h,x)

L = length(h);
d = floor(L/2);
L2 = length(x);
y=zeros(1,L2);
M=L-1;
M2=L2-1;

if fix(abs(h(1:1:d))*10^10) ~= fix(abs(h(L:-1:L-d+1))*10^10)
	disp('error:Not a linear-phase impulse response')
end

if 2*d ~= L
	if fix(h(1:1:d)*10^10) == fix(h(L:-1:L-d+1)*10^10)
		disp('Type-1 Linear-Phase Filter')
        for n=0:M2
            for k=0:M/2-1
                ch1=n-M+k;
                if ch1<0
                    u1=0;
                else
                    u1=x(n-M+k+1);
                end
                ch2=n-M/2;
                if ch2<0
                    u2=0;
                else
                    u2=x(n-M/2+1);
                end
                ch3=n-k;
                if ch3<0
                    u3=0;
                else
                    u3=x(n-k+1);
                end
                y(n+1)=y(n+1)+h(k+1)*(u3+u1);
            end
            y(n+1)=y(n+1)+h(M/2+1)*u2;
        end
	elseif (fix(h(1:1:d)*10^10) == -fix(h(L:-1:L-d+1)*10^10))&(h(M/2+1)==0)
        disp('Type-3 Linear-Phase Filter')
        for n=0:M2
            for k=0:M/2-1
                ch1=n-k;
                if ch1<0
                    u1=0;
                else
                    u1=x(n-k+1);
                end
                ch2=n-M+k;
                if ch2<0
                    u2=0;
                else
                    u2=x(n-M+k+1);
                end
                y(n+1)=y(n+1)+h(k+1)*(u1-u2);
            end
        end
    else
        disp('error:Not Type1~4 linear-phase impulse response')
	end
else
	if fix(h(1:1:d)*10^10) == fix(h(L:-1:L-d+1)*10^10)
		disp('Type-2 Linear-Phase Filter')
        for n=0:M2
            for k=0:(M-1)/2
                ch1=n-k;
                if ch1<0
                    u1=0;
                else
                    u1=x(n-k+1);
                end
                ch2=n-M+k;
                if ch2<0
                    u2=0;
                else
                    u2=x(n-M+k+1);
                end
                y(n+1)=y(n+1)+h(k+1)*(u1+u2);
            end
        end
	elseif fix(h(1:1:d)*10^10) == -fix(h(L:-1:L-d+1)*10^10)
		disp('Type-4 Linear-Phase Filter')
        for n=0:M2
            for k=0:(M-1)/2
                ch1=n-k;
                if ch1<0
                    u1=0;
                else
                    u1=x(n-k+1);
                end
                ch2=n-M+k;
                if ch2<0
                    u2=0;
                else
                    u2=x(n-M+k+1);
                end
                y(n+1)=y(n+1)+h(k+1)*(u1-u2);
            end
        end
    else
        disp('error:Not Type1~4 linear-phase impulse response')
	end
end
   
end

