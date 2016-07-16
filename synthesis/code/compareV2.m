% comparison when the data already exit in Predicted folder

subject='Abhishek';
load('/home/prr/intern/Predicted/Abhishek/Available_sentence.mat');
%pos=find(result==1);

% [b,a] = butter(6,(freq/50));
% dataOut=[];
% for i=1:44
% dataOut(:,i) = filtfilt(b,a,new_output(:,i));
% end
% new_output=dataOut;
for i=1:length(pos)
    X=pos(i);
    disp(['sentence' num2str(i)])
    freq=1;
    for freq=1:1
        AAM=[];k=[];diff=[];
        A=load(['/home/prr/intern/Valli/mats_final/' subject '/' num2str(X) '.mat' ]);
        AAM=A.finalstruct.AAM_all;
        load(['/home/prr/intern/Predicted/Abhishek/' num2str(X) '.mat']);
        k=smoother(k,freq+14);
        AAM=mean_centre(AAM);
        diff=k-AAM;
        temp_mse(freq,:)=sqrt(mean((diff.*diff)));
        
        for j=1:44
        c=corrcoef(AAM(:,j),k(:,j));
        coef(freq,j)=c(2);
        end
 
    end
    %[corr_factor(i,:),pos_coef(i,:)]=max(coef);
    [corr_factor(i,:)]=coef;
%     K=1;
%     for K=1:44
%     MSE(i,K)=temp_mse(pos_coef(K),K);
%     end
      MSE(i,:)=temp_mse;
end