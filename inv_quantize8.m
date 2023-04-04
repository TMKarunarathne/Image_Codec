function quant_macro = inv_quantize8(macro,level)

Q =  level*[ 16  11  10  16  24  40  51  61; 
            12  12  14  19  26  58  60  55; 
            14  13  16  24  40  57  69  56;  
            14  17  22  29  51  87  80  62; 
            18  22  37  56  68  109 103 77;  
            24  35  55  64  81  104 113 92; 
            49  64  78  87  103 121 120 101; 
            72  92  95  98  112 100 103 99];
        

[x, y] = size(macro);
quant_macro=cell(x,y);

for i = 1:1:x
    for j = 1:1:y
        quant_macro{i,j} = round((macro{i,j}).*Q);   
    end    
end

end