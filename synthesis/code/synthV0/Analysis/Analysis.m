X = input('enter the cordinates you want to  analyse :');
load_mat=input('enter the name of the matfile  predicted :','s')


load(['/home/prr/intern/Valli/mats_final/synthesis/code/Result/' load_mat]);
predicted=pos;
load_mat=input('enter the name of the matfile output :','s')
load(['/home/prr/intern/Valli/mats_final/synthesis/code/' load_mat]);
Actual=Output_feature;
plot(predicted(:,X))
hold on
plot(Actual(:,X),'r')
load lowpass_filter.mat
% spectrogram(Actual(:,22),100,80,1024,100);
% figure;spectrogram(predicted(:,22),100,98,128,100);

% for i=1:44
%     pos(:,i) = filter([lpf.Numerator],[1],predicted(:,i));
%     
%     
% end
%save([load_mat 'filtered'],'')



