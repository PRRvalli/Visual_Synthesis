no_aam=5;
no_frames=length(mse);

% mse is available 
% minimum's position
position_matrix=[];
pos=[];


s=size(mse);
C=[];
error=[];
C(1,:)=zeros(1,no_aam);

for i=1:no_aam
start(i)=1+5*(i-1);
stop(i)=5*i;
end

for i=1:no_frames

     for j=1:s(2)
         k=ceil(j/5);
         error(i,j)=C(i,k)+mse(i,j);

     end
     j=1;
     for j=1:no_aam
        temp=error(i,start(j):stop(j));
        C(i+1,j)=min(temp); 
        pos(i,j)=find(temp==min(temp));
%         num=[1:no_aam];
%         pos2=sort_array([temp;num]',1);
     end
      
end
