subject='Abhishek';
%load('/home/prr/intern/Predicted/Niranjana/Available_sentence.mat');
load('/home/prr/intern/Predicted/Abhishek/Available_sentence.mat');
%pos=find(result==1);
%load(['synthV1/' subject '_test_sen.mat']);
train=load(['/home/prr/intern/database/Phonemes' '_good_sen.mat']);
outfolder=['/home/prr/intern/Predicted/' subject '/'];
for i=1:length(pos)
    X=pos(i);
    % filtering is not being done
    disp([num2str(i)]);
    k=predict_output1(X,subject,train);
    save([outfolder num2str(X) '.mat'],'k');
    
    
end
%i=397