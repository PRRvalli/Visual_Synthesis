tic
% file consist of sentence frame lip centre in image
fnames = dir('/media/prr/PRR/PRAVCorpus/images/*.jpg');
numfids = length(fnames);
fileID = fopen('/home/prr/intern/Valli/mats_final/Abhishek_Image_cente.txt','w');
for K = 1:numfids
    disp([num2str(K)])
    I=imread(['/media/prr/PRR/PRAVCorpus/images/',fnames(K).name]);
    lip=optimal_centre(I,'Abhishek');
    [s,f]=sen_fra(fnames(K).name);
    fprintf(fileID,'%d\t%d\t%d\t%d\n',s,f,round(lip(1)),round(lip(2))); 
    
    
    
end
fclose(fileID);
    
toc