fout = 'output/71_cut4.avi';
    Obj = VideoWriter(fout);
    Obj.FrameRate=100;
    open(Obj);
audioPath = ['wav/71.wav'];
for i=1:310
        actual_frame=floor(i/4)+1;
       I=imread(['/home/prr/intern/Valli/images/' num2str(sentence) '_' num2str(actual_frame) '.jpg']);
       I=rgb2hsv(I);
       imagesc(I(:,:,1))
       pause;
       %writeVideo(Obj, I(lip(i,1)-80:lip(i,1)+80,bbox(i,1):bbox(i,1)+minx,1)); 
        
    end
    close(Obj);
    tempFile = ['temp.avi'];
    system(['mencoder -ovc copy -audiofile ' audioPath ' -oac copy ' fout ' -o ' 'temp.avi']);
    system( ['rm ' fout]);
    system(['cp ' tempFile ' ' fout]);
    system( ['rm ' tempFile]);
    
    
    for k=1:1280
        for j=1:720
            if(I(k,j,1)>0.9)
              I(k,j,1)=1; 
            else
              I(k,j,1)=0;  
            end
        end
    end
    imagesc()