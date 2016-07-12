load('input_file4.mat');
[b,a] = butter(6,(5/50));
dataOut=[];
for i=1:44
dataOut(:,i) = filtfilt(b,a,new_output(:,i));

subplot(2,2,1)
spectrogram(new_output(:,1),100,80,1024,100,'yaxis');
subplot(2,2,2)
plot(new_output(:,i));
subplot(2,2,3)
spectrogram(dataOut(:,i),100,80,1024,100,'yaxis');
subplot(2,2,4)
plot(dataOut(:,i),'r');
hold on
plot(new_output(:,i));
%pause
hold off
end
new_output=dataout;
% i=1;
% for i=1:44
%     for j=2:length(new_output)
%         
%     
%     end
% 
%     
% end
% 
% 
% scaled_output=[floor(new_output(:,1:22)*(4/11))+376 floor(new_output(:,23:44)*0.5)+252];
% %plot(scaled_output(1,1:22),scaled_output(1,23:44))
% i=rgb2gray(I);
% for im=1:length(scaled_output)
% i(356:396,207:297)=255;
% x=[1:14 1 15:22 15];
% y=x+22;
% 
% 
% 
% for k=1:23
%    z1=linspace(scaled_output(j,x(k)),scaled_output(j,x(k+1)),100); 
%    z2=linspace(scaled_output(j,y(k)),scaled_output(j,y(k+1)),100); 
%    for j=1:100 
%    i(round(z1(j)),round(z2(j)))=0;
%    end
% end
% 
% end
% for i=1:22
%     plot(scaled_output(1,22+i),scaled_output(1,i),'*', 'markersize', 10)
%     
% end
% 
% for j=1:length(scaled_output)
% imshow(i)
% hold on
% plot(scaled_output(j,y),scaled_output(j,x),'-','markersize',10)
% 
% pause(0.0625);
% hold off
% end