function [Q,R] = householderQR(R)
a = size(R,1);
b = size(R,2);
Q = eye(a);
for i = 1:b
    x = R(i:a,i);
    w = x;
    w(1)=w(1)-norm(x,2);
    w = w/norm(w,2);
    v = zeros(a,1);
    v(i:a) = w;
    H = eye(a)-2*v*v';
    fprintf("w=\n");
    disp(v);
    Q = Q*H;
    fprintf("Q=\n");
    disp(Q);
    R(i:a,i:b) = R(i:a,i:b)-2*w*(w'*R(i:a,i:b));
    fprintf("R=\n");
    disp(R);
end
end
    