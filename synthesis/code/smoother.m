function dataOut=smoother(new_output,freq)

s=size(new_output);
[b,a] = butter(6,(freq/50));
dataOut=[];
for i=1:s(2)
dataOut(:,i) = filtfilt(b,a,new_output(:,i));
end




end