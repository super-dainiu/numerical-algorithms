function [x,res]=CG(A,b,n,x0)
xx=zeros(size(b));
aa=0;
rr=b;
pp=xx;
res=zeros(size(b));
for k = 1:n
    r=rr-aa*A*pp;
    be=(r'*r)/(rr'*rr);
    p=r+be*pp;
    a=(r'*r)/(p'*A*p);
    x=xx+a*p;
    pp=p;
    rr=r;
    aa=a;
    xx=x;
    res(k)=norm(x0-xx,2);
end