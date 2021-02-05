function [eigval,xx] = power_iter(A,x)
epsilon = 10e-12;
xx = A*x;
while norm(x-xx,2)>epsilon
    x = xx;
    xx = A*x;
    xx = xx/norm(xx,2);
end
eigval = xx'*A*xx;