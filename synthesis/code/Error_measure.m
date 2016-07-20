files=dir('/home/prr/intern/Predicted/Nira/');
n=length(files);

for i=3:n
   disp([num2str(i) '..'])
   truth=[];new_output=[];
   load(['/home/prr/intern/Predicted/Nira/' files(i).name])   
   A=load(['/home/prr/intern/Valli/mats_final/Niranjana/' files(i).name]);
   truth=A.finalstruct.AAM_all;
   truth=mean_centre(truth); 
   dataOut=[];
   diff=[];mse=[];
   F=1;
   for freq=1:15
   for F=1:44
       dataOut(:,F)=smoother(new_output(:,F),freq);
       %c=corrcoef(dataOut(:,F),truth(:,F));
       %coef(freq,F)=c(2);
   end
        diff=dataOut-truth;
        mse(freq,:)=sqrt(mean((diff.*diff)));
   end
   [MSE(i-2,:),Fc(i-2,:)]=min(mse);
   %[m(i),Fc(i)]=min(MSE(i,:));
end
%figure;hist(Fc);
