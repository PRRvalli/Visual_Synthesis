 subject='Niranjana';
% load(['synthV1/' subject '_good_sentence.mat']);
c=0;r=0;
load('/home/prr/intern/Predicted/Niranjana/Available_sentence.mat');
for i=1:2368
    
    X=i;
    if(result(i)==1)
    AAM=[];
    A=load(['/home/prr/intern/Valli/mats_final/' subject '/' num2str(X) '.mat' ]);
    AAM=A.finalstruct.AAM_all;
    MFCC=A.finalstruct.MFCC;
     p=A.finalstruct.Phonemes;
     s=length(p);
       if((s~=length(AAM))||(s~=length(MFCC)))
           result(i)=0;
           c=c+1;
       end
       if(((s-1)==length(AAM))||((s-1)==length(MFCC)))
           result(i)=1;
           r=r+1;
       end
       

    if(sum(AAM(:))==0) 
       sen(c)=X;
       result(i)=0;
       c=c+1;
    end
    end
end