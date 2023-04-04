function inv_dif_co = inv_differential_code(dif_co)
len = length(dif_co);
inv_dif_co = dif_co;

for i=2:len
    inv_dif_co(i) = inv_dif_co(i-1)+ dif_co(i);
    
end


end