function dataOut=smoother(new_output,freq)


[b,a] = butter(6,(freq/50));
dataOut=[];
for i=1:44
dataOut(:,i) = filtfilt(b,a,new_output(:,i));
end




end