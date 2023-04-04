function dif_co = differential_code(dc)

dif_co = [dc(1) , dc(2:end) - dc(1:end-1) ];

end