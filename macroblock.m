function macro = macroblock(image ,row_col )

image_size = size(image);
im_r = image_size(1);
im_c = image_size(2);
mac_r = row_col(1);
mac_c = row_col(2);

cell_r = ceil(im_r/mac_r);
cell_c = ceil(im_c/mac_c);

mac_im = zeros(cell_r*mac_r , cell_c*mac_c,'uint8') ; % for padding
% mac_im=uint8(mac_im);
mac_im(1:im_r,1:im_c)= image;

macro = cell(cell_r,cell_c);

for r=1:cell_r
   for c=1:cell_c
      macro{r,c} = mac_im((r-1)*mac_r+1:r*mac_r , (c-1)*mac_c+1:c*mac_c );
   end
end

end


