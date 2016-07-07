Image= retun_path(101,9,2);

b=200;
im=182;
mo=floor(b/(b-im));
r=0;
c=0;
I=zeros(105,200);
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

imshow(uint8(I));
Image2=uint8(I);
b=130;
im=105;
mo=floor(b/(b-im));
r=0;
c=0;
I=zeros(130,200);
i=1;
for i=1:b
    if(mod(i,mo)==0)
    r=r+1;
    I(i,:)=Image2(c,:);
    else
        c=c+1;
        I(i,:)=Image2(c,:);
    end
    
    if(b==c+r)||(c==im)
        break
    end
    
end
imshow(uint8(I))