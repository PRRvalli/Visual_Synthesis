%% Main Function
% Calls the getAudioFile function to store the audio required by sentenceID
% Also calls the synthesizeVideo function to generate the corrsponding
% video *after adding the audio* to the frame sequence

%% Code
tic

subject = 'Abhishek';

sentenceID = 65;

matPath = '../Result/3p3m.mat';
% matPath = '../65_test_3p.mat';
% matPath = 'Analysis/filt_65_3p3m.mat';

audioPath = ['wav/' subject num2str(sentenceID) '.wav'];

% outputVideoPath = 'output\65_filt_3p3m.avi';
% outputVideoPath = 'output/65_actual.avi';
% outputVideoPath = 'output\65_actual.avi';
outputVideoPath = 'output\65_pred.avi';

datasetFolder = 'D:\IISc Summer\SII\Abhishek\SII_Inputs';

% getAudioFile(sentenceID,datasetFolder, audioPath);
synthesizeVideo(matPath, audioPath, outputVideoPath);

toc