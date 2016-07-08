function Image= retun_path(sentenceID,frameID,type)

folder='/home/prr/intern/Abhishek/AAM/';
s=sentenceID-1;
Q = floor(s/100);
rec=['Rec' num2str(Q+1) '/'];
sentence=['s' num2str(sentenceID) '/'];
sen2=sentenceID-(Q*100);
if(type==1)
file_name=['out' num2str(sentenceID) '_' num2str(frameID) '.jpg'];
path=[folder rec sentence file_name];
else
    file_name=['out' num2str(Q+1) '_' num2str(sen2) '_' num2str(frameID) '.jpg'];
    path=[folder rec sentence file_name];
end

load([path '.mat'],'fitted_shape'); 
AAM=fitted_shape;
[M1,I1]=min(AAM(:,1)); % upper lip
[M2,I2]=max(AAM(:,1)); % lower lip

[M3,I3]=min(AAM(:,2)); % left extreme
[M4,I4]=max(AAM(:,2)); % right extreme
Image=imread(path);
% imshow(Image);
% hold on
% plot(mean(AAM(:,2)),mean(AAM(:,1)),'x-', 'markersize', 30)
% hold on 
% plot(mean(AAM(I1,2)),mean(AAM(I1,1)),'x-', 'markersize', 10)
% hold on 
% plot(mean(AAM(I2,2)),mean(AAM(I2,1)),'x-', 'markersize', 10)
% hold on
% plot(mean(AAM(I3,2)),mean(AAM(I3,1)),'x-', 'markersize', 30)
% hold on 
% plot(mean(AAM(I4,2)),mean(AAM(I4,1)),'x-', 'markersize', 10)
% for(i=1:22)
%     plot(mean(AAM(i,2)),mean(AAM(i,1)),'x-', 'markersize', 10)
%     hold on
% end
 %I=Image((min_x-10):(max_x+10),(min_y-10):(max_y+10));
% imshow(I);
Image=Image(floor(M1):round(M2),floor(M3):round(M4),1);
%imshow(Image)
end
