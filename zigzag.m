function zigzag_arr = zigzag(arr)
%
arr_size = size(arr);
zigzag_arr=zeros(1 , arr_size(1)*arr_size(2) ); %
r=1;
c=2;
n=2;
k=1;
zigzag_arr(1)=arr(1,1);
while c+r < arr_size*2+1 
    while ((r*c>0 && c<(arr_size(2)+1)) && r<arr_size(1)+1 ) 
        zigzag_arr(n)=arr(r,c);
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