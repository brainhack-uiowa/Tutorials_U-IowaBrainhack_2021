function cholsolv(A)
n = size(A,1);
L = zeros(n);
for k=1:n
    L(k,k) = sqrt(A(k,k));
    for i=k+1:n
        L(i,k) = A(i,k) / L(k,k);
        for j=k+1:i
            A(i,j) = A(i,j) - L(i,k)*L(j,k);
        end
    end
end
L'
end