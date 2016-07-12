% this is used to find the training sentence /test sentence 
clear

fnames = dir('/home/prr/intern/Valli/mats_final/Abhishek/*.mat');
numfids = length(fnames);
for i=1:numfids
y(i)=numreturn(fnames(i).name);
end
load('/home/prr/intern/Valli/mats_final/synthesis/code/synthV1/train_good_sen.mat');
A=zeros(1,2368);
A(available_sen(:,1))=1;
B=zeros(1,2368);
B(y)=1;
result=B-A;
pos=find(result==1);
%save('/home/prr/intern/Valli/mats_final/synthesis/code/synthV1/test_sen.mat','pos');
