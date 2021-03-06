function [lipCenterCoords] = getLipCenterFromFace(I0, configFilePath)
%% Code Description
% This function gives the coordinates (row, column) of the lip center given an image I0.
% It requires certain params to be set via a configuration file, whose path
% is to be given via configFilePath 
tic
%% Sample config file:
% HalfLipWidth=80
% HalfLipHeight=70
% pass1_windowr=60
% pass1_windowc=80
% pass2_windowr=50
% pass2_windowc=80
% cutoffRatio_max=1.4
% cutoffRatio_min=0.7
% cropping_factor=0.6
% Xsym_factor1=0.5
% Xsym_factor2=0.5
% Ysym_factor1_pass1=0.6
% Ysym_factor2_pass1=0.4
% Ysym_factor1_pass2=0.6
% Ysym_factor2_pass2=0.4
% training_pass1_name=training_new_1
% training_pass2_name=training_new_2
% facedetect_expansion_ratio=1.1
% facecropper_plot_flag=0

%% A Note on the Configuration Parameters:
% cropping_factor: If it equals X, the algorithm analyzes the bottom X fraction of the face    
% pass1_*: Use these alone for now. Ignore the pass2_* params
pass = 1;

%% Get box around face    
    faceDetector = vision.CascadeObjectDetector();    
    bbox = step(faceDetector, I0);
    
    if isempty(bbox)    
        disp('Face not found!');
        return;
    end
    cordinates=[1 1 1 1];
   for i=1:size(bbox,1)
        if(((bbox(i,2)+bbox(i,4))<1280) && ((bbox(i,1)+bbox(i,3))<720) && (bbox(i,3)>100 &&(bbox(i,4)>100)) && (bbox(i,1)<200) && (bbox(i,2)<500))
            cordinates=bbox(i,:)
            break
        end
   end
   bbox=cordinates;
    if(sum(cordinates)~=4)
    face = I0(bbox(2):bbox(2)+bbox(4),bbox(1):bbox(1)+bbox(3),1);
    
%% Initialize variables for The Algorithm 
%   Set variables that can be manually set
    minr1 = 0;
    minr2 = 0;
    width0 = size(face,2);
    height0 = size(face,1);
    
    mincostrow = inf;
    mincostcol = inf;
    costr = [];
    costc = [];
    
% Read the rest from the config file
	fid = fopen(configFilePath);
	config = struct(); 
	temp = textscan(fid,'%s %s','delimiter','=');
	config = cell2struct(temp{2},temp{1},1);
	fclose(fid);

    BBr = round(height0*str2num(config.cropping_factor));
    BBc = 1;
    
    if pass == 1
        windowr = str2num(config.pass1_windowr);
        windowc = str2num(config.pass1_windowc);
    elseif pass == 2
        windowr = str2num(config.pass2_windowr);
        windowc = str2num(config.pass2_windowc);
    end

    HalfLipWidth=str2num(config.HalfLipWidth);
    HalfLipHeight=str2num(config.HalfLipHeight);

%   Get lower half of face
    BB = [BBc, BBr,  width0, height0 - BBr];
%     BB = [BBc, BBr,  width0, height0/str2num(config.facedetect_expansion_ratio) - BBr];

    face1 = imcrop(face(:,:,1), BB);
    face2 = im2double(face1);

    Xsym_factor1=str2num(config.Xsym_factor1);
    Xsym_factor2=str2num(config.Xsym_factor2);
    Ysym_factor1_pass1=str2num(config.Ysym_factor1_pass1);
    Ysym_factor2_pass1=str2num(config.Ysym_factor2_pass1);
    Ysym_factor1_pass2=str2num(config.Ysym_factor1_pass2);
    Ysym_factor2_pass2=str2num(config.Ysym_factor2_pass2);
    
%% Plot settings
% NOTE: Setting this flag to 1 will help visualize the lip center. Avoid in
% case of a gazillion images
    %plot_mode = str2num(config.facecropper_plot_flag);
    plot_mode = 0;
        
%% The algorithm
% We find the point of symmetry across X and Y axis in the lower half of
% the face. For more info, read the write-up on the PRAV corpus.
    %All rows
    for i=windowr+1:size(face2,1)-windowr
        diff = face2(i-1:-1:i-windowr,:)-face2(i+1:i+windowr,:);
        cost = sum(sum(abs(diff)));
        costr(end+1) = cost;

        if cost < mincostrow
            mincostrow = cost;
            minr1 = i-windowr;
            minr2 = i+windowr;
        end
    end

    %All columns
    for i=windowc+1:size(face2,2)-windowc
        diff = face2(:,i-1:-1:i-windowc)-face2(:,i+1:i+windowc);

        cost = sum(sum(abs(diff)));
        costc(end+1) = cost;   

        if cost < mincostcol
             mincostcol = cost;
             minc1 = i-windowc;
             minc2 = i+windowc;
        end
    end

    Xsym = round(Xsym_factor1*minc1 + Xsym_factor2*minc2);
    if pass == 1
        Ysym = round(Ysym_factor1_pass1*minr1 + Ysym_factor2_pass1*minr2);
    else
        Ysym = round(Ysym_factor1_pass2*minr1 + Ysym_factor2_pass2*minr2);
    end
    
    if plot_mode == 1
%       Plot face  
        close all
        videoOut = insertObjectAnnotation(I0,'rectangle',bbox,'Face');
        figure, imshow(videoOut), title('Detected face');        
        
%       Plot lip center
        p = [Xsym, Ysym];
        figure, imshow(face2), hold on;
        plot(p(1),p(2),'Marker','p','Color',[.88 .48 0],'MarkerSize',20)
        plot(1:size(face2,2),minr1, 'r');
        plot(1:size(face2,2),minr2, 'r');
        plot(minc1,1:size(face2,1), 'r');
        plot(minc2,1:size(face2,1), 'r');
    end
    
    lipCenterCoords = [bbox(2)+BBr+Ysym,bbox(1)+BBc+Xsym];
    if  lipCenterCoords(1) > size(I0,1)  | lipCenterCoords(2) > size(I0,2)
        lipCenterCoords = [-1,-1];
    end
    
%   Make this 1 and return "lipCropped" in case you need the lip too
    cropLip = 0;
    if cropLip == 1 && Ysym > 0
        lipCropped = im2double(face(BBr+Ysym-HalfLipHeight:BBr+Ysym+HalfLipHeight,BBc+Xsym-HalfLipWidth:BBc+Xsym+HalfLipWidth,1));
    end
    
    end
toc    
end