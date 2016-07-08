clear
tic
Background=imread(['/home/prr/intern/Valli/images/' num2str(3) '_' num2str(66) '.jpg']);
Background=rgb2gray(Background);

out_folder='output/';
% sentence and their frame number
 load input_file4.mat
% give the actual sentence number 
Actual_sentence =1609;
fout = [out_folder num2str(Actual_sentence) '_new.avi'];
Obj=VideoWriter(fout);
Obj.FrameRate=100;
open(Obj);
audio_extraction(Actual_sentence);
audioPath = ['wav/' num2str(Actual_sentence) '.wav'];
    h=[587];
    w=[359];

n=size(out_fram,2);
for i=1:n
    disp(['frame-' num2str(i)])
    actual_frame=floor(out_fram(i)/4)+1;
    %funtion that returns the folder name
    %I=imread([folder num2str(out_sen(i)) '_' num2str(actual_frame) '.jpg']);
     Image= retun_path2(out_sen(i),actual_frame,out_type(i),Background,h,w);
    
    %s(i,:)=size(I);

   % I=poisson_imaging(h,w,Background,I);
    %Background(535:654,260:439)=I;
    writeVideo(Obj,Image); 
    
    
end

close(Obj);
    tempFile = ['temp.avi'];
    system(['mencoder -ovc copy -audiofile ' audioPath ' -oac copy ' fout ' -o ' 'temp.avi']);
    system( ['rm ' fout]);
    system(['cp ' tempFile ' ' fout]);
    system( ['rm ' tempFile]);

toc