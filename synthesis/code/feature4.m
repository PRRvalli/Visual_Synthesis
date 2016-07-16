clear
load ('/home/prr/intern/Valli/mats_final/synthesis/code/synthV1/Niranjana_good_sentence.mat');
Input_feature=[];
Output_feature=[];
subject='Niranjana';
for i=601:700
    
    A=load(['/home/prr/intern/Valli/mats_final/' subject '/' num2str(available_sen(i,1)) '.mat']);
    if(length(A.finalstruct.MFCC)~=0)
    
    MFCC=A.finalstruct.MFCC;
    Phonemes=A.finalstruct.Phonemes;
    AAM=A.finalstruct.AAM_all;
    n=length(Phonemes);
    
    if(length(MFCC)==n)&&(length(AAM==n))
        disp([num2str(i) '...'])
        K=[];
     for j=1:n
       K(j,:)=[one_hot(Phonemes(j)) MFCC(j,:)]; 
     end
    
    Input_feature=[Input_feature;K];
    Output_feature=[Output_feature;AAM];
   

    end
    
    
    
    end
end    
%       load eigenvector2.mat
%       center=repmat(center,[length(Output_feature),1]);  
%       Output_feature=Output_feature-center;  
%       Output_feature=Output_feature*Q;
%       Output_feature=Output_feature+350; % for Abhishek
%       Output_feature=Output_feature/700; % for Abhishek
%       Output_feature=Output_feature+290;  % for Niranjana
%       Output_feature=Output_feature/522;
%       
%       save('inputs/test_1p1m_PCA_out','Output_feature');
%       save('inputs/test_1p1m_PCA_in','Input_feature');