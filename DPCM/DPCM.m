img_raw = imread('Lena512.bmp');
rows = size(img_raw,1);
cols = size(img_raw,2);
img=double(img_raw);

for i = 1:rows
    for j = 1:cols
        if(j-1 ==0)
            pre(i,j) =0;
        else
            pre(i,j) = img (i , j-1);
        end
    end
end

diff = img - pre;
imshow(diff)

for i = 1:rows
    for j = 1:cols
        if(j-1 ==0)
            decode(i,j) = diff(i,j);
        else
            decode(i,j) = diff(i,j) + decode(i,j-1);
        end
    end
end