function []=synthesizeVideo(fin, audioPath, fout)
%% Function description
% This code uses the coordinates in an AAM feature set to
% generate a video animation. The background is a static 
% frame displaying the edges in a face taken from the PRAV
% corpus. The lip center and the lip dimensions are hard-coded.
% Audio has been added.
% Input: Path to a mat file with the coordinates and the path to which 
% the output is to be saved.
% Output: A video saved to the required path.

%% Read the input file and load background image
    
%     AAMCoords = Output_feature;
    AAMCoords = fin;
    
%% Lip configurations (get lip center and dimensions)
    lipCenter = [685,385];
    halfLipDimensions = [70,120];
    I0 = imread('backgroundFaceEdge.jpg');
    I1 = I0;
    
%% Remove traces of edges
    I1(lipCenter(1)-halfLipDimensions(1):lipCenter(1)+halfLipDimensions(1),...
        lipCenter(2)-halfLipDimensions(2):lipCenter(2)+halfLipDimensions(2))=0;

%% Compute the transformation to be made to AAM 
    AAMCoordsTransformed = reshape(AAMCoords,[],22,2);
% Mean shift each frame
    for i=1:size(AAMCoordsTransformed,1)
        for k=1:2
            AAMCoordsTransformed(i,:,k) = AAMCoordsTransformed(i,:,k) - mean(AAMCoordsTransformed(i,:,k));
        end
    end
%% Get limits of lip in the current AAM shape
    extremaR = max(max(abs(AAMCoordsTransformed(:,:,1))));
    extremaC = max(max(abs(AAMCoordsTransformed(:,:,2))));
    AAMCoordsTransformed(:,:,1) = AAMCoordsTransformed(:,:,1)*halfLipDimensions(1)/extremaR;
    AAMCoordsTransformed(:,:,2) = AAMCoordsTransformed(:,:,2)*halfLipDimensions(2)/extremaC;

%% Mark the points on image    
    Obj = VideoWriter(fout);
    Obj.FrameRate=100;
    open(Obj);
    
    dotDim=1;
    for i = 1:size(AAMCoordsTransformed,1)
        I = I1;
        for k = 1:22
            I(round(AAMCoordsTransformed(i,k,1)+lipCenter(1)-dotDim):...
                round(AAMCoordsTransformed(i,k,1)+lipCenter(1)+dotDim),...
                round(AAMCoordsTransformed(i,k,2)+lipCenter(2)-dotDim):...
                round(AAMCoordsTransformed(i,k,2)+lipCenter(2)+dotDim))=255;
        end
%% Interpolate between points
% Get the equation of the line passing through (x1,y1) and (x2,y2)
% For each x between x1 and x2, get the y lying on the line, make it 1
        lipRange = [1:14 1 15:22 15];
        for k = [1:14 16:23]
            p1 = [AAMCoordsTransformed(i,lipRange(k),1),AAMCoordsTransformed(i,lipRange(k),2)];
            p2 = [AAMCoordsTransformed(i,lipRange(k+1),1),AAMCoordsTransformed(i,lipRange(k+1),2)];          
            m = (p2(2)- p1(2))/(p2(1)-p1(1));
            if p1(1)>p2(1)
                interpRange = p1(1):-1:p2(1);
            else
                interpRange = p1(1):1:p2(1);
            end
            for n = interpRange
                p = zeros(1,2);
                p(1) = round(n);
                p(2) = round(p1(2) + m*(n-p1(1)));
                I(p(1)+lipCenter(1)-dotDim:p(1)+lipCenter(1)+dotDim,...
                    p(2)+lipCenter(2)-dotDim:p(2)+lipCenter(2)+dotDim)=255;
%                 [p(1)+lipCenter(1),p(2)+lipCenter(2)],pause              
            end
        end
%% Add to video
    I = 255-I;
%     imshow(I);pause;
    writeVideo(Obj, I);
    end
    close(Obj);
    
%% Add audio to the video
    tempFile = ['temp.avi'];
    
%     dos(['mencoder -ovc copy -audiofile ' audioPath ' -oac copy ' fout ' -o ' 'temp.avi']);
%     dos( ['del ' fout]);
%     dos(['copy ' tempFile ' ' fout]);
%     dos( ['del ' tempFile]);
    system(['mencoder -ovc copy -audiofile ' audioPath ' -oac copy ' fout ' -o ' 'temp.avi']);
    system( ['rm ' fout]);
    system(['cp ' tempFile ' ' fout]);
    system( ['rm ' tempFile]);

end