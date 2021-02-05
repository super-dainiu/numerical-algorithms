function [L,U] = mylu(A)
   n = size(A);
   L = eye(n);
   U = A;
   
   for i = 1:n-1
      L(i+1:n,i) = U(i+1:n,i)/U(i,i);
      U(i+1:n,i:n) = U(i+1:n,i:n) - L(i+1:n,i) * U(i,i:n);
   end
end
       
