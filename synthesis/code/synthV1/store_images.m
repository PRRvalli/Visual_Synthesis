function store_images(video,label)

%vidName = '/home/prr/intern/Abhishek/Videos/Rec1/1_100v.MP4';
%labName = '/home/prr/intern/Abhishek/Videos/Rec1/1_100l.txt';

vidName=video;
labName=label;
measrows = 3; meascols = inf;

% opens the label.txt 
fidLAB = fopen(labName);
meas = fscanf(fidLAB, '%f', [measrows, meascols])';

Obj = VideoReader(vidName);
nFrames = Obj.NumberOfFrames;
Fs = Obj.FrameRate;


for q = 1:size(meas,1)
   start_frame = round(meas(q,1)*Fs);
   stop_frame=round(meas(q,2)*Fs);
   sentence=meas(q,3);
   for i=start_frame:stop_frame
   I = imrotate(read(Obj,i-1), 90);
   imwrite(I,['/home/prr/intern/Valli/images/' num2str(sentence) '_' num2str(i) '.jpg'])
    
   end
    
end
end



