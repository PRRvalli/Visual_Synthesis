%% video maker keeping the background stationary 
% read the image from the folder

% image folder
folder='/media/prr/PRR/PRAVCorpus/images/';
out_folder='output/';
% sentence and their frame number
 load input_file2.mat
% give the actual sentence number 
Actual_sentence =680;
fout = [out_folder num2str(Actual_sentence) '_pi2.avi'];
Obj=VideoWriter(fout);
Obj.FrameRate=100;
open(Obj);
audio_extraction(Actual_sentence);
audioPath = ['wav/' num2str(Actual_sentence) '.wav'];

Background=imread(['/home/prr/intern/Valli/images/' num2str(10) '_' num2str(4) '.jpg']);
lip_back=optimal_centre(Background,'Abhishek');
% imshow(Background)
% hold on
% rectangle('Position',[lip_back(2)-90,lip_back(1)-70,180,140])

% number of frames information from load file
n=size(out_fram,2);
for i = 1:n
    %% Add to video
    disp(['frame-' num2str(i)])
    actual_frame=floor(out_fram(i)/4)+1;
    I=imread([folder num2str(out_sen(i)) '_' num2str(actual_frame) '.jpg']);
    lip=optimal_centre(I,'Abhishek');
    %Background(lip_back(1)-70:lip_back(1)+70,lip_back(2)-105:lip_back(2)+95,:)=I(lip(1)-70:lip(1)+70,lip(2)-105:lip(2)+90,:);
    I=poisson_imaging(lip_back,lip,Background,I);
    writeVideo(Obj,I);  
end

close(Obj);
    tempFile = ['temp.avi'];
    system(['mencoder -ovc copy -audiofile ' audioPath ' -oac copy ' fout ' -o ' 'temp.avi']);
    system( ['rm ' fout]);
    system(['cp ' tempFile ' ' fout]);
    system( ['rm ' tempFile]);

