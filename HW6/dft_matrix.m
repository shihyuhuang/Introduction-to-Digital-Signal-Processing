function W = dft_matrix(N)

W=zeros(N,N);

for k=1:N
    for n=1:N
        W(k,n)=exp(-1i*2*pi*(k-1)*(n-1)/N);
    end
end

end

