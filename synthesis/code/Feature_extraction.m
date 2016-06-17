clear all
Input_feature=[];
Output_feature=[];

file=['1.mat ';'2.mat ';'3.mat ';'4.mat ';'5.mat ';'6.mat ';'7.mat ';'8.mat ';'9.mat ';'10.mat';'11.mat';'12.mat';'13.mat';'14.mat';'15.mat';'16.mat';'17.mat';'18.mat';'19.mat';'20.mat';'21.mat';'22.mat';'23.mat';'24.mat';'25.mat';'26.mat';'27.mat';'28.mat';'29.mat';'30.mat';'31.mat';'32.mat';'33.mat';'34.mat';'35.mat';'36.mat';'37.mat';'38.mat';'39.mat';'40.mat';]

for j=1:40
A=load(['/home/prr/intern/Valli/mats_final/Abhishek/' file(j)]);
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
for i=2:n-1
    Triphones(i-1,:)=[one_hot(Phonemes(i-1)) one_hot(Phonemes(i)) one_hot(Phonemes(i+1))];
    TriMFCC(i-1,:)=[MFCC(i-1,:) MFCC(i,:) MFCC(i+1,:)];
    
end
P=[];
for i=1:n
   P(i,:)=one_hot(Phonemes(i)); 
end
% k=[Triphones MFCC(2:n-1,:)]; 
%k=[MFCC];     
% k=[TriMFCC];
% k=[Triphones TriMFCC];
% k=[Triphones];
k=[P];
Input_feature=[Input_feature;k];
%Output_feature=[Output_feature;new_aam(2:n-1,:)];
Output_feature=[Output_feature;new_aam];
% Output_feature=[Output_feature;lip(2:n-1,:)];

end

Output_max=max(Output_feature(:));
Output_feature=Output_feature/Output_max;
save('40_train_1p.mat','Input_feature');
save('40_test_1p.mat','Output_feature');




