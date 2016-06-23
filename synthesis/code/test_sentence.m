tic
clear
X = input('sentence :');
sentence=[num2str(X) '.mat'];

train=load(['/home/prr/intern/database/Phonemes_abhishek_train.mat']);
A=load(['/home/prr/intern/Valli/mats_final/Abhishek/' sentence]);
MFCC=A.finalstruct.MFCC;
Phonemes=A.finalstruct.Phonemes;
sen=[];
frame=[];
n=length(Phonemes);

% for i=1:n
%     P=Phonemes(i);
%     [sen(i,:) frame(i,:)]=frame_selection(P,MFCC(i,:));
%     
% 
% 
% end
% prev_aam=zeros(1,44);
    P=Phonemes(1);
    [sen(1,:) frame(1,:) aam array(1,:)]=AAM_selectionV2(P,MFCC(1,:),train);
    
    prev=mean_centre(aam);
for i=2:n
    i
    P=Phonemes(i);
    [sen(i,:) frame(i,:) aam array(i,:)]=AAM_selectionV2(P,MFCC(i,:),train);
    current=mean_centre(aam);
    
mse(i-1,:)=error_calculator(prev,current);
prev=current;
end


toc