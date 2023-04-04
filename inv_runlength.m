function output = inv_runlength(input)
len = length(input)/2;
output = [];
for i =1:len
    output = [ output , input(2*i-1)*ones(1,input(2*i)) ];
    
end

end