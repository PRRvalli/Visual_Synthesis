clear
load ('/home/prr/intern/Valli/mats_final/synthesis/code/synthV1/train_good_sen.mat');
Input_feature=[];
Output_feature=[];

for i=501:600
    A=load(['/home/prr/intern/Valli/mats_final/Abhishek/' num2str(available_sen(i,1)) '.mat']);
    
    if(length(A.finalstruct.MFCC)~=0)
    MFCC=A.finalstruct.MFCC;
    Phonemes=A.finalstruct.Phonemes;
    AAM=A.finalstruct.AAM_all;
    n=length(Phonemes);
    disp([num2str(i) '...'])
    if(length(MFCC)==n)&&(length(AAM==n))
        K=[];
     for j=1:n
       K(j,:)=[one_hot(Phonemes(j)) MFCC(j,:)]; 
     end
    
    Input_feature=[Input_feature;K];
    Output_feature=[Output_feature;AAM];
   

    end
    
    
    
    end
end    
      load eigenvector2.mat
      center=repmat(center,[length(Output_feature),1]);  
      Output_feature=Output_feature-center;  
      Output_feature=Output_feature*Q;
%       Output_feature=Output_feature+350;
%       Output_feature=Output_feature/700;
%       
%       
%       save('inputs/test_1p1m_PCA_out','Output_feature');
%       save('inputs/test_1p1m_PCA_in','Input_feature');