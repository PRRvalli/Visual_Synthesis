function x=getexist(sentence,subject)
path=['/home/prr/intern/Valli/mats_final/' subject '/' num2str(sentence) '.mat' ] ;
if exist(path,'file')
  x=1;
  
else
  x=0;
  
end


end