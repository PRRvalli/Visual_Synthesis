function [f,Phonemes,MFCC,AAM]=getfeature(sentence,subject)
path=['/home/prr/intern/Valli/mats_final/' subject '/' num2str(sentence) '.mat' ] ;
  A=load(path);
  MFCC=A.finalstruct.MFCC;
  Phonemes=A.finalstruct.Phonemes;
  AAM=A.finalstruct.AAM_all;
  n=length(Phonemes);
  
  if(n==length(AAM))&&(n==length(MFCC))
      f=floor(length(AAM)/4);
  else
      f=-1;
  end
  
end