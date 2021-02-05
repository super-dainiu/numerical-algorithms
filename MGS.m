function [Q,R]=MGS(Q)
a = size(Q,1);
b = size(Q,2);

for i = 1:b
    R(i,i) = norm(Q(:,i),2);
    Q(:,i) = Q(:,i)/R(i,i);
    for j = i+1:b
        R(i,j) = Q(:,i)'*Q(:,j);
        Q(:,j) = Q(:,j)-R(i,j)*Q(:,i);
    end
end