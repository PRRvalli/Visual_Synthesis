close all 
clear

fnames = dir('/home/prr/intern/Valli/mats_final/Abhishek/*.mat');
numfids = length(fnames);

    Input_feature=[];
    Output_feature=[];
    
    for K=201:210
        
        A=load(['/home/prr/intern/Valli/mats_final/Abhishek/' fnames(K).name]);
        MFCC=A.finalstruct.MFCC;
        Phonemes=A.finalstruct.Phonemes;
        AAM=A.finalstruct.AAM_all;
        n=length(Phonemes);
        if(length(MFCC)==n)&&(length(AAM==n))
        Triphones=[];
        TriMFCC=[];
        k=[];
        P=[];
        for i=1:n
%             Triphones(i-1,:)=[one_hot(Phonemes(i-1)) one_hot(Phonemes(i)) one_hot(Phonemes(i+1))];
%             TriMFCC(i-1,:)=[MFCC(i-1,:) MFCC(i,:) MFCC(i+1,:)];
             P(i,:)= one_hot(Phonemes(i));
         end
        k=[P MFCC];
        %k=[Triphones];
        %k=[Triphones MFCC(2:n-1,:)];
        Input_feature=[Input_feature;k];
        Output_feature=[Output_feature;AAM];
        
        end
    end
    
      load eigenvector2.mat
      center=repmat(center,[length(Output_feature),1]);  
      Output_feature=Output_feature-center;  
      Output_feature=Output_feature*Q;
      Output_feature=Output_feature/1004;
      % change these names before running 
%       save('inputs/test_1p1m_PCA_out','Output_feature');
%       save('inputs/test_1p1m_PCA_in','Input_feature');
%       