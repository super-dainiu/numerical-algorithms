function L = mychol(A)
   n = size(A);
   L = A;
   
   for i = 1:n
      L(i,i+1:n) = 0;
      L(i,i) = sqrt(L(i,i));
      L(i+1:n,i) = L(i+1:n,i)/L(i,i);
      for j = i+1:n
          L(j:n,j) = L(j:n,j) - L(j:n,i)*L(j,i);
      end
      disp(L)
   end
end