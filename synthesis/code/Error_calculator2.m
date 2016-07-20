files=dir('/home/prr/intern/Predicted/Abhi/');
n=length(files);
% 
% for i=3:n
%    disp([num2str(i) '..'])
%    truth=[];new_output=[];
%    load(['/home/prr/intern/Predicted/Abhishek/' files(i).name])   
%    A=load(['/home/prr/intern/Valli/mats_final/Abhishek/' files(i).name]);
%    truth=A.finalstruct.AAM_all;
%    truth=mean_centre(truth); 
%    dataOut=[];
%    diff=[];mse=[];
%    F=1;
%    for freq=1:15
%    for F=1:44
%        dataOut(:,F)=smoother(k(:,F),freq);
%        %c=corrcoef(dataOut(:,F),truth(:,F));
%        %coef(freq,F)=c(2);
%    end
%         diff=dataOut-truth;
%         mse(freq,:)=sqrt(mean((diff.*diff)));
%    end
%    [MSE(i-2,:),Fc(i-2,:)]=min(mse);
%    %[m(i),Fc(i)]=min(MSE(i,:));
% end
% %figure;hist(Fc);
load('/home/prr/intern/Predicted/Abhi_Fc.mat')
mean_Fc=mean(Fc);
%n=length(Fc);
for i=3:n
   disp([num2str(i) '..'])
   truth=[];new_output=[];
   load(['/home/prr/intern/Predicted/Abhi/' files(i).name])   
   A=load(['/home/prr/intern/Valli/mats_final/Abhishek/' files(i).name]);
   truth=A.finalstruct.AAM_all;
   truth=mean_centre(truth); 
   dataOut=[];
   diff=[];
   F=1;
   
   for F=1:44
       dataOut(:,F)=smoother(new_output(:,F),mean_Fc(F));
       c=corrcoef(dataOut(:,F),truth(:,F));
       coef(i-2,F)=c(2);
   end
        diff=dataOut-truth;
        mse(i-2,:)=sqrt(mean((diff.*diff)));
  
   
end


Array=sum(mse');
Array=[Array ;[1:n-2]];
Array=Array';
Array=sort_array(Array,300);
sort(Array);
Final_mse=mse(Array,:);
imagesc(Final_mse)
stem(mean(Final_mse))
Final_corr=coef(Array,:);
stem(mean(Final_corr))
save('/home/prr/intern/Predicted/Abhi_300sentence.mat','Fc','Final_corr','Final_mse')
