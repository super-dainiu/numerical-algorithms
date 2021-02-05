function [x,res]=GD(A,b,n,x0)
x=zeros(size(b));
res=zeros(size(b));
for k = 1:n
    r=b-A*x;
    a=(r'*r)/(r'*A*r);
    x=x+a*r;
    res(k)=norm(x0-x,2);
end