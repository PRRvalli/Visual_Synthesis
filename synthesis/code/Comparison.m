%input sentence 
clear
load('/home/prr/intern/Valli/mats_final/synthesis/code/synthV1/test_sen.mat');
%for freq=1:10
%fileID = fopen('/home/prr/intern/Valli/Abhi_error.txt','r');
freq=1;
for j=1:320
disp(['sentence :' num2str(j) '...'])
X=pos(j);
cf(j,1,freq)=X;
AAM=[];k=[];diff=[];
A=load(['/home/prr/intern/Valli/mats_final/Abhishek/' num2str(X) '.mat' ]);
AAM=A.finalstruct.AAM_all;

MFCC=A.finalstruct.MFCC;
p=A.finalstruct.Phonemes;
s=length(p);
AAM=mean_centre(AAM);
if((s==length(AAM))&&(s==length(p)))
k=predict_output(X,15);
%videomaker_outline(X,AAM,'real');
%videomaker_outline(X,k,'check');
% Error calculation
% RMSE
diff=k-AAM;
mse(j,:,freq)=sqrt(mean((diff.*diff)));

cf(j,2,freq)=mean(mse(j,:));


for i=1:44
coef(j,i)=corr_factor(AAM(:,i),k(:,i));
end    
cf(j,3,freq)=mean(coef(j,:));

else
 cf(j,:,freq)=[X 0 0];
end
 
end
%end
% for p=5:10
%    plot(cf(:,3,p))
%    hold on
% end
fileID = fopen('/home/prr/intern/Valli/Abhi_error.txt','w');
fprintf(fileID,'sent\tMSE\t\tcorrelation\n');
for i=1:320
   fprintf(fileID,'%d\t%4.4f\t\t%4.4f\n',cf(i,:)); 
end
fclose(fileID);
sum=0;
sum2=0;
num=0;
for i=1:320
   if(cf(i,3)~=0) 
      sum=sum+cf(i,3);
      sum2=sum2+cf(i,2);
      num=num+1;
   end
end
average_corr=sum/num;
average_mse=sum2/num;