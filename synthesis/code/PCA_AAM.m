%% PCA representation of the AAM as it is  44 - dimension  
%  mean centre the data and store the value .
clear all
close all
tic
fnames = dir('/home/prr/intern/Valli/mats_final/Abhishek/*.mat');
numfids = length(fnames);
% X - matrix which is input to the PCA ;
X=[];
for K = 1:numfids
    
    A=load(['/home/prr/intern/Valli/mats_final/Abhishek/' fnames(K).name]);
    AAM=A.finalstruct.AAM_all;
    X=[X;AAM];
    
    
end
m=mean(X);
centre=m;
m=repmat(m,[length(X),1]);
newX=X-m;
sum(mean(newX));
[Vectors,score,latent,tsquared,explained,mu] = pca(newX);
Q=zeros(44,8);
for i=1:8
   Q(:,i)=Vectors(:,i); 
    
    
end
% transformation to the new eigvector space
Transformed=newX*Q;
% retransformation to see how it is close to the previous representation
revtransform=Transformed*Q';

toc