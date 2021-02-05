function [Q,R] = CGS(Q)
a = size(Q,1);
b = size(Q,2);
R(1,1) = norm(Q(:,1),2);
Q(:,1) = Q(:,1)/R(1,1);
for i = 2:b
    v = Q(:,i);
    for j = 1:i-1
        R(j,i) = Q(:,j)'*Q(:,i);
        v = v-R(j,i)*Q(:,j);
    end
    Q(:,i) = v;
    R(i,i) = norm(Q(:,i),2);
    Q(:,i) = Q(:,i)/R(i,i);
end