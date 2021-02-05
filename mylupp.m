function [L,U,piv] = mylupp(A)
   n = size(A);
   L = eye(n);
   U = A;
   
   for i = 1:n-1
      piv(i) = i;
      for j = i+1:n
          if abs(U(j,i))>abs(U(piv(i),i))
              piv(i) = j;
              disp(j)
          end
      end
      if piv(i) ~= i
          U([i,piv(i)],i:n) = U([piv(i),i],i:n);
          L([i,piv(i)],1:i) = L([piv(i),i],1:i);
          disp(U)
      end
      L(i+1:n,i) = U(i+1:n,i)/U(i,i);
      U(i+1:n,i:n) = U(i+1:n,i:n) - L(i+1:n,i) * U(i,i:n);
      L(i,i) = 1;
      disp(L);
      disp(U);
   end
end