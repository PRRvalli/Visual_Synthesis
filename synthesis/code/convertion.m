
% Matlab code for one hot encoding
% Phonemes to triphones convertion
clear all
Input_feature=[];
Output_feature=[];

file=['1.mat ';'2.mat ';'3.mat ';'4.mat ';'5.mat ';'6.mat ';'7.mat ';'8.mat ';'9.mat ';'10.mat';'11.mat';'12.mat';'13.mat';'14.mat';'15.mat';'16.mat';'17.mat';'18.mat';'19.mat';'20.mat';]

for j=1:20
A=load(['/home/sgeadmin/Valli/mats_final/Abhishek/' file(j)]);
MFCC=A.finalstruct.MFCC;
Phonemes=A.finalstruct.Phonemes;
AAM_all=A.finalstruct.AAM_all;

n=length(Phonemes);
Triphones=[];
for i=2:n-1
    Triphones(i-1,:)=[one_hot(Phonemes(i-1)) one_hot(Phonemes(i)) one_hot(Phonemes(i+1))];
   
end
k=[Triphones MFCC(2:n-1,:)];
Input_feature=[Input_feature;k];
Output_feature=[Output_feature;AAM_all(2:n-1,:)];
end











