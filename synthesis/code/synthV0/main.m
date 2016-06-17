%% Main Function
% Calls the getAudioFile function to store the audio required by sentenceID
% Also calls the synthesizeVideo function to generate the corrsponding
% video *after adding the audio* to the frame sequence

%% Code
tic

subject = 'Abhishek';

sentenceID = 10;
matPath = '../4.mat';
audioPath = ['wav/' subject num2str(sentenceID) '.wav'];
outputVideoPath = 'output\4.avi';
datasetFolder = 'D:\IISc Summer\SII\Abhishek\SII_Inputs';

getAudioFile(sentenceID,datasetFolder, audioPath);
synthesizeVideo(matPath, audioPath, outputVideoPath);

toc