function [x,frame]=sentence_exist(sentence,subject)
path=['/home/prr/intern/Valli/mats_final/' subject '/' num2str(sentence) '.mat' ] ;
if exist(path,'file')
  x=1;
  A=load(path);
  AAM=A.finalstruct.AAM_all;
  frame=floor(length(AAM)/4);
else
  x=0;
  frame=-1;
end


end