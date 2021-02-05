function [smapic]=compresspic(picadd,lim,i)
    pic = imread(picadd);
    smapic = SVDcompress(pic,lim);
    subplot(5,5,i);
    imshow(smapic);
    