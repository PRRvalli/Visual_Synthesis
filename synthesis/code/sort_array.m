%% this is a time consuming bubble sort which sorts the array keeping the key values unchanged
%  this is similar to sorting a dictionary based on the particular key
%  Actual bubble sort is  time consuming as it compares and swapes for n*n/2.
%  we need only the first 20 min elements hence the first for loop iterates
%  20 times 
%  num --> number of closest MFCC to be returned
%  

function A=sort_array(array,num)
n=length(array);
% we can compare out results by taking the 20 or above closest mfcc 
for i=1:num
    for j=i+1:n
        if(array(i,1)>=array(j,1))
            temp=array(i,:);
            array(i,:)=array(j,:);
            array(j,:)=temp;
        end
        
    end
    
end

A=array(1:num,2);

end