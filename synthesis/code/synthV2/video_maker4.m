clear
tic
Background=imread(['/home/prr/intern/Valli/images/' num2str(10) '_' num2str(4) '.jpg']);
Background=rgb2gray(Background);
lip_window=Background(535:654,260:439);
b=size(lip_window);
out_folder='output/';
% sentence and their frame number
 load input_file3.mat
% give the actual sentence number 
Actual_sentence =951;
fout = [out_folder num2str(Actual_sentence) '_AAM3.avi'];
Obj=VideoWriter(fout);
Obj.FrameRate=100;
open(Obj);
audio_extraction(Actual_sentence);
audioPath = ['wav/' num2str(Actual_sentence) '.wav'];
    h=[535,654];
    w=[260,439];

n=size(out_fram,2);
for i=1:n
    disp(['frame-' num2str(i)])
    actual_frame=floor(out_fram(i)/4)+1;
    %funtion that returns the folder name
    %I=imread([folder num2str(out_sen(i)) '_' num2str(actual_frame) '.jpg']);
     Image= retun_path(out_sen(i),actual_frame,out_type(i));
    [I_row,I_column]=size(Image);
    if(b(1)>I_row)
        I=up_row(Image,b(1));
    else
        I=down_row(Image,b(1));
    end
    
    if(b(2)>I_column)
       I=up_column(I,b(2));
    else
        I=down_col(I,b(2));
    end
    %s(i,:)=size(I);

    I=poisson_imaging(h,w,Background,I);
    %Background(535:654,260:439)=I;
    writeVideo(Obj,I); 
    
    
end

close(Obj);
    tempFile = ['temp.avi'];
    system(['mencoder -ovc copy -audiofile ' audioPath ' -oac copy ' fout ' -o ' 'temp.avi']);
    system( ['rm ' fout]);
    system(['cp ' tempFile ' ' fout]);
    system( ['rm ' tempFile]);

toc