function [eigval,vv]=rayl_quot_iter(A,v)
n = size(A);
I = eye(n);
ei = 0;
eigval = v'*A*v;
vv = inv(A-eigval*I)*v;
vv = vv/norm(vv,2);
epsilon = 10e-8;
cycle = 1;
while (norm(v-vv,2)>epsilon) && (cycle<500000) && ~(isnan(eigval))
    v = vv;
    ei = eigval;
    eigval = v'*A*v;
    if cond(A-eigval*I) < 10e12
        vv = inv(A-eigval*I)*v;
    end
    vv = vv/norm(vv,2);
    cycle = cycle+1;
end
if cycle == 500000
   fprintf("not converge!\n");
end
eigval = vv'*A*vv;