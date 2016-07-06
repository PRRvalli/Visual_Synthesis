function [recID,sen]=getvalue(rec,sentence)
recID=str2num(rec(4:end));

sentenceID=str2num(sentence(2:end));
ID=(recID-1)*100;
if(sentenceID>ID)
    sen=sentenceID-ID;
else
    sen=sentenceID;
end



end