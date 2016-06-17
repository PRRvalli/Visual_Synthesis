%% README: 
% This code uses the coordinates in an AAM feature set to
% generate a video animation. The background is a static 
% frame displaying the edges in a face taken from the PRAV
% corpus. The lip center and the lip dimensions are hard-coded.
% Audio has been added.
% Input: Path to a mat file with the coordinates and the path to which 
% the output is to be saved.
% Output: A video saved to the required path.

%%
function []=synthesizeVideo(fin, fout)
    load(fin);
    AAMCoords = Output_feature;
end