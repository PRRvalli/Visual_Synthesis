function [ I ] = getFaceImageFromLocation( subject, sentenceID, frameID, folder)
    %% Description:
    % This function outputs the frame corresponding to a sentence and 
    % a frame number

    %% Get the file to fet frames from 
    sampleFactor = 4; % The upsampling factor for AAM samples wrt 25Hz
    frameIDActual = floor(frameID / sampleFactor);

    Q = floor(sentenceID/100);
    beginID = Q*100+1;
    if Q == 23
        endID = 2368;
    else
        endID = beginID + 99;
    end
    vidName = [folder '/' subject '/Videos/Rec' num2str(Q+1) '/'...
        num2str(beginID) '_' num2str(endID) 'v.MP4'];
    labName = [folder '/' subject '/Videos/Rec' num2str(Q+1) '/'...
        num2str(beginID) '_' num2str(endID) 'l.txt'];

    %% Get the appropriate frame from the file
    measrows = 3; meascols = inf;

    fidLAB = fopen(labName);
    meas = fscanf(fidLAB, '%f', [measrows, meascols])';

    for q = 1:size(meas,1)
        if meas(q,3)~=sentenceID
            continue
        end
        Obj = VideoReader(vidName);
        % time - 2 sec 
        nFrames = Obj.NumberOfFrames;
        Fs = Obj.FrameRate;
        
        start_frame = round(meas(q,1)*Fs);
        stop_frame=round(meas(q,2)*Fs);
        I = imrotate(read(Obj,start_frame+frameIDActual-1), 90);
        break;
    end
end