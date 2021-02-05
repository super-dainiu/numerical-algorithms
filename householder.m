function [x,w] = householder(x,t)
n = size(x);
a = norm(x(t:n),2);
w(t+1:n) = x(t+1:n);
w(t) = sign(x(t))*a+x(t);
x(t) = a;
x(t+1:n)=0;
w = w'/norm(w,2);
