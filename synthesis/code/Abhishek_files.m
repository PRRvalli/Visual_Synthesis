subject='Abhishek';
c=0;k=0;r=0;
for i=1:2368
   
    if(AA(i)==1)
    A=load(['/home/prr/intern/Valli/mats_final/' subject '/' num2str(i) '.mat' ]);
    AAM=A.finalstruct.AAM_all;
    MFCC=A.finalstruct.MFCC;
    p=A.finalstruct.Phonemes; 
    
    if(length(MFCC)==0)
    AA(i)=0;k=k+1;
    end
    s=length(p);
       if((s~=length(AAM))||(s~=length(MFCC)))
           AA(i)=0;
           c=c+1;
       end
       if(((s-1)==length(AAM))||((s-1)==length(MFCC)))
           AA(i)=1;
           r=r+1;
       end
    
    end
end

save('/home/prr/intern/Predicted/Abhishek/Available_sentence.mat','pos');