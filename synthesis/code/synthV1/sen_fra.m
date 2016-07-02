function [sentence,frame]=sen_fra(string)
n=length(string);

pos=find(string=='_');

sentence=str2num(string(1:pos-1));
frame=str2num(string(pos+1:n-4));
end

