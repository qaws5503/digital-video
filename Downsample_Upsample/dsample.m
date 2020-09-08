function [out] = dsample(im , factor)

im_half = downsample(im,factor);
out_turn = downsample(permute(im_half,[2 1 3]),factor);

out = permute(out_turn,[2 1 3]);
end