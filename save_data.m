function save_data(array,name)

a1=sprintf(num2str(array));
fid = fopen(name,'wt');
fprintf(fid, a1);
fclose(fid);

end