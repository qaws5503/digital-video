img1 = imread("stefan_0_rgb.bmp");
img2 = imread("stefan_3_rgb.bmp");
img_out = img1(:,:,1);
MAE_min = 255*(16*16);

for k = 0:17
    for l = 0:21
        img2_in = double(img2(k*16+1:(k*16)+16,l*16+1:(l*16)+16,1));
        for i = -16 :15
            for j = -16:15
                if k*16+i+1>0 && l*16+j+1>0 && l*16+16+j<=352 && k*16+16+i<=288
                    img1_in = double(img1(k*16+i+1:(k*16)+16+i,l*16+j+1:(l*16)+16+j,1));
                    MAE = 1/(16*16)*sum(sum(abs(img2_in-img1_in)));
                    if MAE<MAE_min
                        MAE_min = MAE;
                        Vec_i = i;
                        Vec_j = j;
                    end
                end
            end
        end
        img_out(k*16+1:(k*16)+16,l*16+1:(l*16)+16,1) =...
            img_out(k*16+Vec_i+1:(k*16)+16+Vec_i,l*16+Vec_j+1:(l*16)+16+Vec_j,1);
        MAE_min = 255*(16*16);
    end
end
