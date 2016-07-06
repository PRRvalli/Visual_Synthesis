Background=imread(['/home/prr/intern/Valli/images/' num2str(10) '_' num2str(4) '.jpg']);
lip_window=Background(530:659,255:454,:);

out_folder='output/';
% sentence and their frame number
 load input_file2.mat
% give the actual sentence number 
Actual_sentence =680;
fout = [out_folder num2str(Actual_sentence) '_AAM.avi'];
Obj=VideoWriter(fout);
Obj.FrameRate=100;
open(Obj);
audio_extraction(Actual_sentence);
audioPath = ['wav/' num2str(Actual_sentence) '.wav'];

n=size(out_fram,2);
for i=1:n
    disp(['frame-' num2str(i)])
    actual_frame=floor(out_fram(i)/4)+1;
    %funtion that returns the folder name
    %I=imread([folder num2str(out_sen(i)) '_' num2str(actual_frame) '.jpg']);
     Image= retun_path(out_sen(i),actual_frame);

    %writeVideo(Obj,I); 
    
    
end

