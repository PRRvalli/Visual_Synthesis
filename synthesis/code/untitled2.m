for i=1:8
n=Vectors(i*5,:);
%nn=n+mn;
subplot(4,2,i)
plot(n(1,:));

end

plot(Vectors(1:22,1),Vectors(23:44,1));
plot(Vectors(1:22,10),Vectors(23:44,10));
plot(Vectors(1:22,40),Vectors(23:44,40));
plot(Vectors(1:22,4),Vectors(23:44,4));
plot(Vectors(1:22,3),Vectors(23:44,3));
plot(Vectors(1:22,5),Vectors(23:44,5));
Q=zeros(44,8);
for i=1:8
   Q(:,i)=Vectors(:,i); 
    
    
end
plot(revtransform(1,1:22)+m(1,1:22),revtransform(1,23:44)+m(1,23:44))
hold on ;plot(newX(1,1:22)+m(1,1:22),newX(1,23:44)+m(1,23:44),'r');