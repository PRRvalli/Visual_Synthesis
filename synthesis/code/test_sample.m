% fileID = fopen('/home/prr/intern/Valli/Niranjana_good.txt','r');
% formatSpec = '%d\t%d\t%d\t%d\t%d\n';
% sizeA = [5 Inf];
% A=fscanf(fileID,formatSpec,sizeA);
% fclose(fileID);
% A=A';
% A=A(:,1);
% load('/home/prr/intern/Predicted/Niranjana/test_sentence.mat','test_sentence');
% load('/home/prr/intern/Valli/mats_final/synthesis/code/synthV1/Niranjana_good_sentence.mat')
% c=1;
% for i=1:length(test_sentence)
%     pos=[];
%     pos=find(available_sen==test_sentence(i));
%     if(isempty(pos)==0)
%        rem(c)=test_sentence(i);
%        c=c+1;
%     end
%     
%     
% end

load('/home/prr/intern/Predicted/Nira_rem.mat');
for t=1:length(rem)
   disp(['sentence no:' num2str(t)])
   truth=[];new_output=[];
   load(['/home/prr/intern/Predicted/Nira/' num2str(rem(t)) '.mat']); 
   A=load(['/home/prr/intern/Valli/mats_final/Niranjana/' num2str(rem(t)) '.mat']);
   truth=A.finalstruct.AAM_all;
   
   
   truth=mean_centre(truth);
   
   
   dataOut=[];
   F=1;
   for freq=1:15
   for F=1:44
       dataOut(:,F)=smoother(new_output(:,F),freq);
       c=corrcoef(dataOut(:,F),truth(:,F));
       coef(freq,F)=c(2);
   end
        diff=dataOut-truth;
        temp_mse(freq,:)=sqrt(mean((diff.*diff)));
   end

      [M(t,:),Po(t,:)]=max(coef);
      K=1;
      for K=1:44
      MSE(t,K)=temp_mse(Po(t,K),K);
      end
    
    
    
    
end