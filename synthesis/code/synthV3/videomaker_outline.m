function videomaker_outline(X,new_output,subject,str)
if(str==2)
    [b,a] = butter(6,(5/50));
    dataOut=[];
    for i=1:44
    dataOut(:,i) = filtfilt(b,a,new_output(:,i));
    end

new_output=dataOut;
end
out_folder='output/';
I=imread('female_image.jpg');
I2=imread('female_image2.jpg');
% 335 and 262 are the centre in the image taken 
scaled_output=[floor(new_output(:,1:22)*(41/90))+335 floor(new_output(:,23:44)*(75/132))+262];
Actual_sentence =X;
fout = [out_folder num2str(Actual_sentence) '_No:' num2str(str) '.avi'];
Obj=VideoWriter(fout);
Obj.FrameRate=100;
open(Obj);
audio_extraction(Actual_sentence,subject);
audioPath = ['wav/' subject '_' num2str(Actual_sentence) '.wav'];

for number=1:length(new_output)
new_output(number,:)=alignment(new_output(number,:));
end

r=randi([1 length(new_output)-25],1,floor(length(new_output)/120));
f=1:30;
f=repmat(f,[1,length(r)]);
r=repmat(r,[30,1]);r=r(:)';
r=f+r;
r=sort(r);r=[r 0];
r_pos=1;

for im=1:length(scaled_output)
%i(350:400,200:300)=255;
x=[1:14 1 15:22 15];
y=x+22;
if(im==r(r_pos))
i=I2;r_pos=r_pos+1;
else
i=I;    
end

for k=1:14
   z1=linspace(scaled_output(im,x(k)),scaled_output(im,x(k+1)),100); 
   z2=linspace(scaled_output(im,y(k)),scaled_output(im,y(k+1)),100); 
   for j=1:100 
   i(round(z1(j)),round(z2(j)))=0;
   end
end
for k=16:23
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
