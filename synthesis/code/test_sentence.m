tic
X = input('sentence :');
sentence=[num2str(X) '.mat'];


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
prev_aam=zeros(1,44);
for i=1:n
    P=Phonemes(i);
    [sen(i) frame(i) aam]=AAM_selection(P,MFCC(i,:),prev_aam);
    prev_aam=aam;


end


toc