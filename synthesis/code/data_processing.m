listing = dir('/home/prr/intern/Valli/mats_final/Abhishek/*.mat');
len=length(listing);

%fileID = fopen('/home/prr/intern/Valli/mats_final/Abhishek_sen_fram.txt','w');

for i=1:len
    A=load(['/home/prr/intern/Valli/mats_final/Abhishek/' listing(i).name]); 
    disp([num2str(i) '-sentence processed....'])
    AAM=A.finalstruct.AAM_all;
    frame(i,1)=numreturn(listing(i).name);
    frame(i,2)=length(AAM);
    
    %fprintf(fileID,'%d\t%d\n',frame(i,1),frame(i,2));
    
    
    
    
end

csvwrite('sentence_frames.csv',frame);
save('sentence_frame.mat','frame')

