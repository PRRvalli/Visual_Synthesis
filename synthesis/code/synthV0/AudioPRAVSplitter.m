function AudioPRAVSplitter(inFolder, outFolder)
%% Code Description
% This function accepts as input the directory to a subject's video recording
% that contains folders of the form Rec1, Rec2...Rec24.
% It splits all the audio files in the database and stores them in the
% output folder
tic
%% Obtain all the folder names
    measrows = 3;
    meascols = inf;

    %mkdir(outFolder);
    for videoID = 1:24
        disp(['Processing video ' num2str(videoID)]);
        beginID = (videoID-1)*100+1;
        if videoID == 24
            endID = 2368;
        else
            endID = videoID*100;
        end
        wavName = [inFolder '/Rec' num2str(videoID) '/'...
            num2str(beginID) '_' num2str(endID) 'a.wav'];
        labName = [inFolder '/Rec' num2str(videoID) '/'...
            num2str(beginID) '_' num2str(endID) 'l.txt'];
        
%% Get the frames in which the sentences lie, extract them
        fid = fopen(labName);
        meas = fscanf(fid, '%f', [measrows, meascols])';

        [y, Fs] = audioread(wavName);

        for j = 1:size(meas,1)
            k = meas(j,3);
            target_wav = [outFolder '/' num2str(k) '.wav'];
            start_frame = round(meas(j,1)*Fs);
            stop_frame = round(meas(j,2)*Fs);
            segment = y(start_frame:stop_frame);
            audiowrite(target_wav, segment, Fs);
        end   
    end
toc
end