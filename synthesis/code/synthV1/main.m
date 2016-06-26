%% Main Function
% As of now, just gets a frame given the subject, sentenceID and frameID

%% Code
tic
%clc;%clear all; close all;
subject = 'Abhishek';
for i=1:227
sentenceID = out_sen(i);
frameID = out_fram(i);
%for sentenceID = 1:4:100
    %sentenceID
    %I = getFaceImageFromLocation(subject, sentenceID, frameID, 'D:\IISc Summer\RECORDING\RECORDING');
    I(:,:,:,i) = getFaceImageFromLocation(subject, sentenceID, frameID, '/home/prr/intern');	
%end
%imshow(I);
end
toc
