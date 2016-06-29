function videoPRAVSplitter(inFolder, outFolder)
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
    for videoID = 1:1
        disp(['Processing video ' num2str(videoID)]);
        beginID = (videoID-1)*100+1;
        if videoID == 24
            endID = 2368;
        else
            endID = videoID*100;
        end
        vidName = [inFolder '/Rec' num2str(videoID) '/'...
            num2str(beginID) '_' num2str(endID) 'v.MP4'];
        labName = [inFolder '/Rec' num2str(videoID) '/'...
            num2str(beginID) '_' num2str(endID) 'l.txt'];
        label=[inFolder '/Rec' num2str(videoID) '/'...
            num2str(beginID) '_' num2str(endID) 'a.txt']; 
%% Get the frames in which the sentences lie, extract them
        fid = fopen(labName);
        meas = fscanf(fid, '%f', [measrows, meascols])';
        fid2 = fopen(label,'r');
        lag = fscanf(fid2, '%f');

        Obj = VideoReader(vidName);
        nFrames = Obj.NumberOfFrames;
        Fs = Obj.FrameRate;

        for j = 1:size(meas,1)
            start_frame = round((meas(j,1)-lag)*Fs);
            stop_frame=round((meas(j,2)-lag)*Fs);
            sentence=meas(j,3);
            c=1;
            i=start_frame;
            for i=start_frame:stop_frame
            I = imrotate(read(Obj,i), 90);
            imwrite(I,[outFolder '/' num2str(sentence) '_' num2str(c) '.jpg'])
            c=c+1;
            end
        end  
        fclose(fid);
        fclose(fid2);
    end
toc
end