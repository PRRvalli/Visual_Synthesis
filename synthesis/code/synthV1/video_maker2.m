    n=310;
    sentence=71;
    fout = 'output/71_cut2.avi';
    Obj = VideoWriter(fout);
    Obj.FrameRate=100;
    open(Obj);
    audio_extraction(sentence);
    audioPath = ['wav/' num2str(sentence) '.wav'];
    for i = 1:n
    %% Add to video
    actual_frame=floor(i/4)+1;
    I=imread(['/home/prr/intern/Valli/images/' num2str(sentence) '_' num2str(actual_frame) '.jpg']);
    [lip(i,:) bbox(i,:)]=getface_cord(I,'conf_Abhishek.txt');
    end
    minx=min(bbox(:,3));
    miny=min(bbox(:,4));
    for i=1:310
        actual_frame=floor(i/4)+1;
       I=imread(['/home/prr/intern/Valli/images/' num2str(sentence) '_' num2str(actual_frame) '.jpg']);
       writeVideo(Obj, I(lip(i,1)-80:lip(i,1)+80,bbox(i,1):bbox(i,1)+minx,:)); 
        
    end
    close(Obj);
    tempFile = ['temp.avi'];
    system(['mencoder -ovc copy -audiofile ' audioPath ' -oac copy ' fout ' -o ' 'temp.avi']);
    system( ['rm ' fout]);
    system(['cp ' tempFile ' ' fout]);
    system( ['rm ' tempFile]);
