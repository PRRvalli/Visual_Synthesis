clear all


fnames = dir('/home/prr/intern/Valli/mats_final/Abhishek/*.mat');
numfids = length(fnames);

    Input_feature=[];
    Output_feature=[];
for K = 100:519
if(K~=166)
 %fnames(K).name
A=load(['/home/prr/intern/Valli/mats_final/Abhishek/' fnames(K).name]);
MFCC=A.finalstruct.MFCC;
Phonemes=A.finalstruct.Phonemes;
AAM_all=A.finalstruct.AAM_all;
%lips=A.AAM_lipsonly
n=length(Phonemes);
new_aam=[];
mean_x=mean(AAM_all(:,1:22)');
mean_y=mean(AAM_all(:,23:44)');
mean_x=repmat(mean_x',[1,22]);
mean_y=repmat(mean_y',[1,22]);
new_aam(:,1:22)=AAM_all(:,1:22)-mean_x;
new_aam(:,23:44)=AAM_all(:,23:44)-mean_y;

%lip=[new_aam(:,1) new_aam(:,4) new_aam(:,5) new_aam(:,6) new_aam(:,9) new_aam(:,12) new_aam(:,1) new_aam(:,1+22) new_aam(:,4+22) new_aam(:,5+22) new_aam(:,6+22) new_aam(:,9+22) new_aam(:,12+22) new_aam(:,1+22)];

Triphones=[];
TriMFCC=[];
k=[];
for i=2:n-1
    Triphones(i-1,:)=[one_hot(Phonemes(i-1)) one_hot(Phonemes(i)) one_hot(Phonemes(i+1))];
    TriMFCC(i-1,:)=[MFCC(i-1,:) MFCC(i,:) MFCC(i+1,:)];
    
end


k=[Triphones TriMFCC];

Input_feature=[Input_feature;k];
Output_feature=[Output_feature;new_aam(2:n-1,:)];
% Output_feature=[Output_feature;new_aam];
% Output_feature=[Output_feature;lip(2:n-1,:)];    
end
end
Output_max=max(Output_feature(:));
Output_feature=Output_feature/Output_max;

save('420_train_3p3m.mat','Input_feature');
save('420_test_3p3m.mat','Output_feature');