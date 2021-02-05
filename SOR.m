function [x,residue]=SOR(A,b,w,sol,n)
error = inf;
x = zeros(size(b));
residue = zeros(n,1);
for i=1:n
    D = zeros(size(A));
    L = zeros(size(A));
    for j=1:size(A,1)
        D(j,j)=A(j,j);
        L(j,1:j-1)=A(j,1:j-1);
    end
    U = D+L-A;
    r = w*b+((1-w)*D+w*U)*x;
    x = myFM(D+w*L,r);
    residue(i)=norm(x-sol,2);
end