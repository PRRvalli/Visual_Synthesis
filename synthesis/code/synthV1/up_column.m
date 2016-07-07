function I=up_column(Image,b)

im=size(Image,2);
mo=floor(b/(b-im));
r=0;
c=0;
I=zeros(size(Image,1),b);
for i=1:b
    if(mod(i,mo)==0)
    r=r+1;
    I(:,i)=Image(:,c);
    else
        c=c+1;
        I(:,i)=Image(:,c);
    end
    
    if(b==c+r)||(c==im)
        break
    end
    
end
I=uint8(I);
end