function [x,residue]=Jacobi_iter(A,b,sol,n)
error = inf;
x = zeros(size(b));
residue = zeros(n,1);
for i = 1:n
    D = zeros(size(A));
    for j=1:size(A,1)
        D(j,j)=A(j,j);
    end
    C = A-D;
    r = b-C*x;
    x = myFM(D,r);
    residue(i)=norm(x-sol,2);
end