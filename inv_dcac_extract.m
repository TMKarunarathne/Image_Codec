function dec_dct_cof= inv_dcac_extract(dc , ac , x ,y)
% x : number of rows in the macro block
% y : number of columns in the macro block
len_dc = length(dc);
ac_len = length(ac)/len_dc; %number of ac components for one macro block
dec_dct_cof = cell(x,y);
n = 1;

for i = 1:x
    for j = 1:y
        arr=[dc(n) , ac( (n-1)*ac_len+1 :n*ac_len )];
        ac_dc_arr = inv_zigzag(arr,8,8);
        dec_dct_cof{i,j}=ac_dc_arr;
 
        n=n+1;
    end
end

end