function I= retun_path2(sentenceID,frameID,type,background,h,w)

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

Image=imread(path);


background = double(background);
Image = double(Image);

m1=mean(AAM(:,2));
m2=mean(AAM(:,1));
% m1(+ or -) 100
s=size(Image);
Lf = imGradFeature(background);
Gf = imGradFeature(Image);
top=floor(min(AAM(:,1))); % upper lip
bottom=ceil(max(AAM(:,1))); % lower lip

left=floor(min(AAM(:,2))); % left extreme
right=ceil(max(AAM(:,2))); % right extreme

% if((floor(m1)+100)>s(2))
%     max_limit1=s(2);
%     x1=s(2)-floor(m1);
% else
%     max_limit1=(floor(m1)+100);
%     x1=100;
% end
% 
% if((floor(m1)-100)<1)
%     min_limit1=1;
%     x2=floor(m1)-1;
% else
%     min_limit1=(floor(m1)-100);
%     x2=100;
% end
% 
% if((floor(m2)+70)>s(1))
%     max_limit2=s(1);
%     x3=s(1)-floor(m2);
% else
%     max_limit2=(floor(m2)+70);
%     x3=70;
% end
% 
% if((floor(m2)-70)<1)
%     min_limit2=1;
%     x4=floor(m2)-1;
% else
%     min_limit2=(floor(m2)-70);
%     x4=70;
% end
if(right>s(2))
    max_limit1=s(2);
    x1=s(2)-floor(m1);
else
    max_limit1=right;
    x1=right-floor(m1);
end

if(left<1)
    min_limit1=1;
    x2=floor(m1)-1;
else
    min_limit1=left;
    x2=floor(m1)-left;
end

if(bottom>s(1))
    max_limit2=s(1);
    x3=s(1)-floor(m2);
else
    max_limit2=bottom;
    x3=bottom-floor(m2);
end

if(top<1)
    min_limit2=1;
    x4=floor(m2)-1;
else
    min_limit2=top;
    x4=floor(m2)-top;
end


%Lf(h:h+d1+10,w:w+d2+15,:,:) = Gf(floor(M1):floor(M1)+d1+10,floor(M3):floor(M3)+d2+15,:,:);
Lf(h-x4:h+x3,w-x2:w+x1,:,:) = Gf(min_limit2:max_limit2,min_limit1:max_limit1,:,:);
param = buildModPoissonParam( size(Lf) );
Y = modPoisson( Lf, param, 1E-8 );
I=uint8(Y);
end
