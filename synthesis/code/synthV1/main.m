%% Main Function
% As of now, just gets a frame given the subject, sentenceID and frameID

%% Code
tic
clc;clear all; close all;
subject = 'Abhishek';

sentenceID = 10;
frameID = 80;
for sentenceID = 1:4:100
    sentenceID
    I = getFaceImageFromLocation(subject, sentenceID, frameID, 'D:\IISc Summer\RECORDING\RECORDING');
end
% imshow(I);
toc