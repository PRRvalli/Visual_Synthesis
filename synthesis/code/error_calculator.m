function MSE=error_calculator(A,B)
% A ---- previous 
% B ---- current
s=size(A);
c=1;
for i=1:s(1)
   mat=repmat(A(i,:),[s(1),1]);
   error=B-mat;
   MSE(c,:)=sqrt(sum((error.*error)'));
   c=c+1;
end

MSE=MSE(:);
end