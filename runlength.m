function output = runlength(input)

x=length(input);
count = 1;
output = [];

for i = 1:1:x-1
    if (input(i) == input(i+1))
        count = count + 1;
    else
        output = [output,input(i),count];
        count = 1;
    end
end

%adding missed last element
output = [output,input(x),count];


end