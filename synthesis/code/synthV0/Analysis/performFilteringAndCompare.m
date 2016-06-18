%% This code filters the predicted output and compares it with the actual AAM output
tic
%% Load files
% Predicted
load('../../Result/3p3m.mat');
predOut = pos;
load('../../65_test_3p3m.mat');
realOut = Output_feature;

%% Filter the output and plot
% lpFilt = designfilt('lowpassfir','PassbandFrequency',0.98, ...
%          'StopbandFrequency',0.99,'PassbandRipple',0.5, ...
%          'StopbandAttenuation',65,'DesignMethod','kaiserwin');
% fvtool(lpFilt);
% filtOut = filter(lpFilt,predOut);

[b,a] = butter(5,.15);
filtOut = filtfilt(b,a,predOut);

%% Plot the vectors for a point
pointID = 21;
figure(1);
subplot(311); plot(realOut(:,pointID)); title('Expected');hold on;
subplot(312); plot(predOut(:,pointID)); title('Actual'); hold on;
subplot(313); plot(filtOut(:,pointID)); title('Filtered');

%% Save the output
pos = filtOut;
save('filt_65_3p3m.mat','pos');
toc