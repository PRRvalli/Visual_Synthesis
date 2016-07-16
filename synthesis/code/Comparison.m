
% clear
% subject='Abhishek';
% load(['synthV1/' subject '_test_sen.mat']);
% train=load(['/home/prr/intern/database/Phonemes' subject '_good_sen.mat']);

%fileID = fopen('/home/prr/intern/Valli/Abhi_error.txt','r');
freq=1;
% for freq=1:15
% disp(['sentence :' num2str(freq) '...'])
train=1;
for j=150:170
disp(['sentence :' num2str(pos(j)) '...'])
X=pos(j);
cf(j,1,freq)=X;
AAM=[];k=[];diff=[];
A=load(['/home/prr/intern/Valli/mats_final/' subject '/' num2str(X) '.mat' ]);
AAM=A.finalstruct.AAM_all;

MFCC=A.finalstruct.MFCC;
p=A.finalstruct.Phonemes;
s=length(p);
AAM=mean_centre(AAM);

if((s==length(AAM))&&(s==length(p)))
    k=predict_output(X,15,subject,train);
    %videomaker_outline(X,AAM,'real');
    %videomaker_outline(X,k,'check');
    
    diff=k-AAM;
    mse(j,:,freq)=sqrt(mean((diff.*diff)));

    cf(j,2,freq)=mean(mse(j,:));


    for i=1:44
    c=corrcoef(AAM(:,i),k(:,i));
    coef(j,i)=c(2);
    end    
    cf(j,3,freq)=mean(coef(j,:));

    else
     cf(j,:,freq)=[X 0 0];
end
 
end
%end

% fileID = fopen('/home/prr/intern/Valli/Abhi_error.txt','w');
% fprintf(fileID,'sent\tMSE\t\tcorrelation\n');
% for i=1:320
%    fprintf(fileID,'%d\t%4.4f\t\t%4.4f\n',cf(i,:)); 
% end
% fclose(fileID);
% sum=0;
% sum2=0;
% num=0;
% for i=1:320
%    if(cf(i,3)~=0) 
%       sum=sum+cf(i,3);
%       sum2=sum2+cf(i,2);
%       num=num+1;
%    end
% end
% average_corr=sum/num;
% average_mse=sum2/num;

% for p=1:5
% a(1,:)=cf(p,3,:);
% plot(a);
% pause(1)
% end