function [] = getAudioFile(sentenceID, folder, fout)
%% ***INCOMPLETE*** 
% This function gets the audio file corresponding to a sentence name
% assuming that the file is appropriately named. For instance, for sentence
% 420, the audio file must '401_500a.wav' in the folder
    
%% Compute the name of the audio file 
%     [Q,R] = quorem(sentenceID, 100); %NOT SUPPORTED! :(
    Q = floor(sentenceID/100);
    beginID = Q*100+1;
    if Q == 23
        endID = 2368;
    else
        endID = beginID + 99;
    end
    wavName = [num2str(beginID) '_' num2str(endID) 'a.wav'];
    labName = [num2str(beginID) '_' num2str(endID) 'l.txt'];
    
    measrows = 3; meascols = inf;
    
    fidWAV = fopen([folder  '/'  labName]);
    meas = fscanf(fidWAV, '%f', [measrows, meascols])';
    [y, Fs] = audioread([folder  '/'  wavName]);

    for q = 1:size(meas,1)
    %         [p q]
    %         is=num2str(q); number = '000'; number(end-length(is)+1:end)=is;
            if meas(q,3)~=sentenceID
                continue
            end
            start_frame = round(meas(q,1)*Fs);
            stop_frame = round(meas(q,2)*Fs);
            segment = y(start_frame:stop_frame);
            audiowrite(fout, segment, Fs);
    end
end

