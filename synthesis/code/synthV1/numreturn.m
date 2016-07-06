%% this the mat function that return the sentence number corresponding to the matfile
% 195.mat ---input 
% 195 --> sentence number output 

function y=numreturn(file_name)
n=length(file_name);
a=[1000 100 10 1 0 0 0 0];
val=[];
if(n==5)
val=[0 0 0 file_name-'0.mat'];
sum(val.*a);
end

if(n==6)
    val=[0 0 file_name-'00.mat'];
    
end

if(n==7)
    val=[0 file_name-'000.mat'];
    
end

if(n==8)
  val=[file_name-'0000.mat'];
      
end
y=sum(val.*a); 
end