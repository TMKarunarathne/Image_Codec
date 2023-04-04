%% =====   MINI PROJECT E/16/177   ===== %%
close all
clear all
clc
%% add to path
cd 'D:\7th sem\EE596-Image and Video Coding\Mini Project\my_project\image';
%% Read the original image into a Matrix
ori_im = imread('Lenna.png');
figure;
imshow(ori_im);
title('Original Image');

gray_im = rgb2gray(ori_im); % convert to gray
figure;
imshow(gray_im,[]);
title('Full Gray Scale Image');
%% Split to macro blocks
macro = macroblock(gray_im , [8 8]);
%% DCT
dct_cof = dctf(macro);
%% Quantizing
% for low quality level = 4
% for medium quality level = 1
% for high quality level = 0.25
level = 1; % by changing the level we can change the quality
quant_dct = quantize8(dct_cof,level);
%% DC and AC extraction
[dc ,ac] = dcac_extract(quant_dct);
%% Differential coding for dc components
dif_dc_co = differential_code(dc);
%% Apply run length for ac components
run_len_ac = runlength(ac);

%% dc huffman coding
% dc sybol probability calculation
[prob_dc,symb_dc] = prob_symb(dif_dc_co);
% Huffman Codebook
codebook_dc = Huff_codebook( prob_dc , symb_dc );
% Encode the dc
dc_encoded=Huff_encode( dif_dc_co ,codebook_dc);
% Encoded array save as a txt
file_01 = 'encoded_dc.txt';
save_data(dc_encoded,file_01);

%% ac huffman coding
% ac sybol probability calculation
[prob_ac,symb_ac] = prob_symb(run_len_ac);
% Huffman Codebook
codebook_ac = Huff_codebook( prob_ac , symb_ac );
% Encode the ac
ac_encoded=Huff_encode( run_len_ac ,codebook_ac);
% Encoded array save as a txt
file_02 = 'encoded_ac.txt';
save_data(ac_encoded,file_02);

%% DC decoding
dec_dc_dif = Huff_decode(file_01,codebook_dc); % huffman decoding the dc
dec_dc_co = inv_differential_code(dec_dc_dif );
%% AC decoding
dec_ac_run = Huff_decode(file_02,codebook_ac); % huffman decoding the ac
dec_ac = inv_runlength(dec_ac_run);
%% Combine the decoded dc and ac
[row_mac , col_mac] = size(macro);
dec_dct_cof= inv_dcac_extract(dec_dc_co , dec_ac , row_mac , col_mac);
%% inverse quantizer
dec_dct = inv_quantize8(dec_dct_cof,level);
%% inverse dct
dec_macro = inv_dctf(dec_dct);
%% from macro blocks to full image
[row_im , col_im] = size(gray_im);
dec_gray_im = inv_macroblock(dec_macro ,row_im , col_im );
%% plot image
fig2=figure;
imshow(gray_im,[]);
title('Full Gray Scale Image');
%%%saveas(fig2,'Full_Gray_Image_.jpg');

fig1=figure;
imshow(dec_gray_im,[]);
title('Reconstructed Full Image');
saveas(fig1,'Reconstructed_Image_'+string(level*100)+'.jpg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% END %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
