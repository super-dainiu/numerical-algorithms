function [x]=page_rank(A)
n = size(A,1);
x = zeros(n,1);
x(1) = 1;
temp = 0;
epsilon = 10e-6;
while norm(x-temp,2)>epsilon
    temp = x;
    x = A*x;
end