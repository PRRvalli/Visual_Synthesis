    
    fout = 'output/1_cut.avi';
    Obj = VideoWriter(fout);
    Obj.FrameRate=100;
    open(Obj);
    
    % number of frames
    n=227;
    sentence=1;
    %outputVideoPath = 'output/1_check.avi';
    audio_extraction(sentence);
    audioPath = ['wav/' num2str(sentence) '.wav'];
    prev=[0 0];
    for i = 1:n
    %% Add to video
    actual_frame=floor(i/4)+1;
    I=imread(['/home/prr/intern/Valli/images/' num2str(sentence) '_' num2str(actual_frame) '.jpg']);
    w = getLipCenterFromFace(I,'conf_Abhishek.txt',prev);
    writeVideo(Obj, I(w(1)-85:w(1)+85,:,:));
    prev=w;
    end
    close(Obj);
    
    %% Add audio to the video
    tempFile = ['temp.avi'];
    system(['mencoder -ovc copy -audiofile ' audioPath ' -oac copy ' fout ' -o ' 'temp.avi']);
    system( ['rm ' fout]);
    system(['cp ' tempFile ' ' fout]);
    system( ['rm ' tempFile]);

    