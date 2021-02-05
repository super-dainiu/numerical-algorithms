function [eig] = QR_iter(A)
n = size(A);
i = n;
I = eye(i);
eig = A;
epsilon = 10e-6;
for k = 1:5
    if i>2
        I = eye(i);
        wil = A(i-1:i,i-1:i);
        delta = (wil(1,1)-wil(2,2))/2;
        if delta>=0
            shift = wil(2,2)+delta-sqrt(delta*delta+wil(1,2)*wil(2,1));
        else
            shift = wil(2,2)+delta+sqrt(delta*delta+wil(1,2)*wil(2,1));
        end
        [Q,R]=qr(A(1:i,1:i)-shift*I);
        A(1:i,1:i) = R*Q+shift*I;
        disp(A)
        if (abs(A(i-1,i))<10e-6)
            if i>2
                i = i-1;
            end
        end
    else
        [Q,R]=qr(A(1:i,1:i));
        A(1:i,1:i) = R*Q;
        disp(A)
    end
end
    
    
    