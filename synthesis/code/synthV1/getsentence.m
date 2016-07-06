function sen=getsentence(rec,sentence)
ID=str2num(rec(4:end));
sentenceID=str2num(sentence(2:end));
ID=(ID-1)*100;
if(sentenceID>ID)
    sen=sentenceID;
else
    sen=ID+sentenceID;
end




end