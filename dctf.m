function dct_cof = dctf(macro)

[x, y] = size(macro);
dct_cof = cell(x,y);

for i = 1:1:x
    for j = 1:1:y
        %2-D discrete cosine transform
        dct_cof{i,j} = dct2(macro{i,j}); 
    end
end

end