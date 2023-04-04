function [dc ac] = dcac_extract(quant_dct)

[x, y] = size(quant_dct);
dc=[];
ac=[];

for i = 1:1:x
    for j = 1:1:y
        zigzag_dct = zigzag(quant_dct{i,j}); 
        dc = [ dc , zigzag_dct(1) ];
        ac = [ ac , zigzag_dct(2:end) ];
        
    end
end

end