fnames = dir('/home/prr/intern/Valli/mats_final/Abhishek/*.mat');
numfids = length(fnames);
fileID = fopen('/home/prr/intern/Valli/mats_final/Abhishek_test.txt','w');
for K = 1:10
    disp([num2str(K)])
    fprintf(fileID,'%d\t%s\n',K,fnames(K).name); 
    
    
    
end

fclose(fileID);

fileID = fopen('/home/prr/intern/Valli/mats_final/Abhishek_test.txt','r');

