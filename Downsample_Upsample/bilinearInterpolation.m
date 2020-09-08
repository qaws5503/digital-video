function [out] = bilinearInterpolation(im, out_dims)
%% section1
    in_rows = size(im,1);
    in_cols = size(im,2);
    out_rows = out_dims(1);
    out_cols = out_dims(2);

%% section2
    S_R = in_rows / out_rows;
    S_C = in_cols / out_cols;
    
    [cf, rf] = meshgrid(1 : out_cols, 1 : out_rows);

    rf = rf * S_R;
    cf = cf * S_C;
%% section3
    r = floor(rf);
    c = floor(cf);

    r(r < 1) = 1;
    c(c < 1) = 1;
    r(r > in_rows - 1) = in_rows - 1;
   c(c > in_cols - 1) = in_cols - 1;
%% section4
    beta = rf - r;
    alpha = cf - c;
%% section5
    point_a = sub2ind([in_rows, in_cols], r, c);
    point_b = sub2ind([in_rows, in_cols], r+1,c);
    point_c = sub2ind([in_rows, in_cols], r, c+1);
    point_d = sub2ind([in_rows, in_cols], r+1, c+1);       
%% section6
    out = zeros(out_rows, out_cols, size(im, 3));
    out = cast(out, class(im));
%% section7
    for idx = 1 : size(im, 3)
        value = double(im(:,:,idx));
        e = (1-alpha).*value(point_a) + alpha.*value(point_b);
        f = (1-alpha).*value(point_c) + alpha.*value(point_d);
        P = (1-beta).*e + beta.*f;
        out(:,:,idx) = cast(P, class(im));
    end