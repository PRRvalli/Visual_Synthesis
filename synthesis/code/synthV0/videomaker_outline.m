function videomaker_outline(X,new_output)
[b,a] = butter(6,(10/50));
dataOut=[];
for i=1:44
dataOut(:,i) = filtfilt(b,a,new_output(:,i));
end
new_output=dataOut;

out_folder='/home/prr/intern/Valli/mats_final/synthesis/code/synthV0/output/';
% sentence and their frame number
%load ('../synthV2/input_file4.mat');
I=imread('/home/prr/intern/Valli/mats_final/synthesis/code/synthV0/test_male.png');
i=rgb2gray(I);
% give the actual sentence number 
% 376 and 252 are the centre in the image taken 
scaled_output=[floor(new_output(:,1:22)*(4/11))+376 floor(new_output(:,23:44)*0.5)+252];
Actual_sentence =X;
fout = [out_folder num2str(Actual_sentence) '_set.avi'];
Obj=VideoWriter(fout);
Obj.FrameRate=100;
open(Obj);
audio_extraction(Actual_sentence);
audioPath = ['/home/prr/intern/Valli/mats_final/synthesis/code/synthV0/wav/' num2str(Actual_sentence) '.wav'];


for im=1:length(scaled_output)
i(350:400,200:300)=255;
x=[1:14 1 15:22 15];
y=x+22;



for k=1:23
   z1=linspace(scaled_output(im,x(k)),scaled_output(im,x(k+1)),100); 
   z2=linspace(scaled_output(im,y(k)),scaled_output(im,y(k+1)),100); 
   for j=1:100 
   i(round(z1(j)),round(z2(j)))=0;
   end
end
writeVideo(Obj,i);
end
close(Obj);
    tempFile = ['temp.avi'];
    system(['mencoder -ovc copy -audiofile ' audioPath ' -oac copy ' fout ' -o ' 'temp.avi']);
    system( ['rm ' fout]);
    system(['cp ' tempFile ' ' fout]);
    system( ['rm ' tempFile]);
end
