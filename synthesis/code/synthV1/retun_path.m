cfunction Image= retun_path(sentenceID,frameID)

folder='/home/prr/intern/Abhishek/AAM/';
s=sentenceID-1;
Q = floor(s/100);
rec=['Rec' num2str(Q+1) '/'];
sentence=['s' num2str(sentenceID) '/'];
file_name=['out' num2str(sentenceID) '_' num2str(frameID) '.jpg'];
path=[folder rec sentence file_name];


load([path '.mat'],'fitted_shape'); 
AAM=fitted_shape;

max_y=max(AAM(:,1));
max_x=max(AAM(:,2));
min_x=min(AAM(:,1));
min_y=min(AAM(:,2));


Image=imread(path);
imshow(Image);
hold on
plot(mean(AAM(:,2)),mean(AAM(:,1)),'x-', 'markersize', 30)
% Image=Image((min_x-10):(max_x+10),(min_y-10):(max_y+10));
% imshow(Image);

end
