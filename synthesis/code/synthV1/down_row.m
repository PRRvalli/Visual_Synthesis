function I=down_row(Image,b)
% we can set the limit     

im=size(Image,1);
mo=floor(im/(im-b));
r=b;
c=0;
I=[];
i=1;
for i=1:im
    if(mod(i,mo)~=0)
        c=c+1;
        r=r-1;
        I(c,:)=Image(i,:);
    end
    if((im-i)==r)
        I(c+1:b,:)=Image(i+1:im,:);
        break
    end
    if(c==b)
        break
    end
    
end
I=uint8(I);


end