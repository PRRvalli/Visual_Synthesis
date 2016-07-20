files=dir('/home/prr/intern/Predicted/Nira/');
n=length(files);
r=randi([3,n],1,53);
T=zeros(15,44);
i=1;
for i=1:53
   disp([num2str(i) '..'])
   truth=[];new_output=[];
   load(['/home/prr/intern/Predicted/Nira/' files(r(i)).name])   
   A=load(['/home/prr/intern/Valli/mats_final/Niranjana/' files(r(i)).name]);
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
        Mse(freq,:)=sqrt(mean((diff.*diff)));
   end
   T=T+Mse;
end
[min_mse,mean_Fc]=min(T);
R=ones(1,n);
sub=zeros(1,n);
sub(r)=1;
R=R-sub;
rem_sen=find(R==1);

mse=[];
for i=3:length(rem_sen)
   disp([num2str(i) '..'])
   truth=[];new_output=[];
   load(['/home/prr/intern/Predicted/Nira/' files(rem_sen(i)).name])   
   A=load(['/home/prr/intern/Valli/mats_final/Niranjana/' files(rem_sen(i)).name]);
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
