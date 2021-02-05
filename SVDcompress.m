function [smapic] = SVDcompress(pic,lim)
    pic = im2double(pic);
    for i = 1:3
        [U,S,V] = svd(pic(:,:,i));
        S(lim:size(U),lim:size(V)) = 0;
        A = U*S*V';
        smapic(:,:,i) = A;
    end
end