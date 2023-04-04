function im = inv_macroblock(macro ,row_im , col_im )
% row_im : number of rows in original image
% col_im : number of columns in original image
im = cell2mat(macro);
im = im(1:row_im,1:col_im);
im = uint8(im);
end
