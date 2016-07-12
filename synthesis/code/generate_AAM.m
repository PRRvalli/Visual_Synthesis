clear
fileID = fopen('/home/prr/intern/Valli/test_sentence.txt','r');
sizeA=[8 Inf];
formatSpec = '%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t';
A = fscanf(fileID,formatSpec,sizeA);
fclose(fileID);
A=A';
new_output=[];
for i=1:20
   k=[];
   disp([num2str(i) '...'])
   k=predict_output(A(i,1));
   %new_output=[new_output ;k]; 
   %n(i)=length(k);
   videomaker_outline(A(i,1),k);
   
    
    
end


