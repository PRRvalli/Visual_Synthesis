%% enter the sentence number the corresponding audio file will be extracter 
    % Checked with the sentence and audio file 
    function []=audio_extraction(sentenceID)
    %sentenceID=665;
    s=sentenceID-1;
    Q = floor(s/100);
    beginID = Q*100+1;
    
    if Q == 23
        endID = 2368;
    else
        endID = beginID + 99;
    end
    inFolder='/home/prr/intern/Abhishek/Videos';
    outFolder='/home/prr/intern/Valli/mats_final/synthesis/code/synthV1/wav';
    wavName = [inFolder '/Rec' num2str(Q+1) '/'...
            num2str(beginID) '_' num2str(endID) 'a.wav'];
    labName = [inFolder '/Rec' num2str(Q+1) '/'...
            num2str(beginID) '_' num2str(endID) 'l.txt'];
    label=[inFolder '/Rec' num2str(Q+1) '/'...
            num2str(beginID) '_' num2str(endID) 'a.txt'];    
        
    measrows = 3;
    meascols = inf;
        fid2 = fopen(label,'r');
        lag = fscanf(fid2, '%f');
        fid = fopen(labName);
        meas = fscanf(fid, '%f', [measrows, meascols])';
        
        
        [y, Fs] = audioread(wavName);
        
        for j = 1:size(meas,1)
            if(sentenceID==meas(j,3))
            target_wav = [outFolder '/' num2str(sentenceID) '.wav'];
            start_frame = round(meas(j,1)*Fs);
            stop_frame = round(meas(j,2)*Fs);
            segment = y(start_frame:stop_frame);
            audiowrite(target_wav, segment, Fs);
            end
        end  
        
        fclose(fid);
        fclose(fid2);
    end