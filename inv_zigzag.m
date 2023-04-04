function zigzag_arr = inv_zigzag(arr,row,col)
% arr : row or column vector
% row : numb of required rows of output
% col : numb of required molumns of output
arr_size = [row col];
zigzag_arr=zeros(arr_size ); %
r=1;
c=2;
n=2;
k=1;
zigzag_arr(1,1)=arr(1);
while c+r < arr_size*2+1 
    while ((r*c>0 && c<(arr_size(2)+1)) && r<arr_size(1)+1 ) 
        zigzag_arr(r,c)=arr(n);
        n=n+1;
        r=r+k;
        c=c-k;
    end
    
    r=r-k;
    c=c+k;
    
    if (r==1 && c~=arr_size(2) )
       c=c+1;
    elseif (c==1 && r~=arr_size(1))
        r=r+1;
    elseif (r==arr_size(1) )
       c=c+1;
    elseif (c==arr_size(2))
        r=r+1;
    end
    
    k=-k;
end

end