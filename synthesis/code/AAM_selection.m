function [sentence frame aam]=AAM_selection(Phoneme,MFCC,prev_aam)

train=load(['/home/prr/intern/database/Phoneme' num2str(Phoneme) '.mat']);


if(Phoneme==1)
Matrix_train=train.Phonemes1;
end
if(Phoneme==2)
Matrix_train=train.Phonemes2;
end
if(Phoneme==3)
Matrix_train=train.Phonemes3;
end
if(Phoneme==4)
Matrix_train=train.Phonemes4;
end
if(Phoneme==5)
Matrix_train=train.Phonemes5;
end
if(Phoneme==6)
Matrix_train=train.Phonemes6;
end
if(Phoneme==7)
Matrix_train=train.Phonemes7;
end
if(Phoneme==8)
Matrix_train=train.Phonemes8;
end
if(Phoneme==9)
Matrix_train=train.Phonemes9;
end
if(Phoneme==10)
Matrix_train=train.Phonemes10;
end
if(Phoneme==11)
Matrix_train=train.Phonemes11;
end
if(Phoneme==12)
Matrix_train=train.Phonemes12;
end
if(Phoneme==13)
Matrix_train=train.Phonemes13;
end
if(Phoneme==14)
Matrix_train=train.Phonemes14;
end
if(Phoneme==15)
Matrix_train=train.Phonemes15;
end
if(Phoneme==16)
Matrix_train=train.Phonemes16;
end
if(Phoneme==17)
Matrix_train=train.Phonemes17;
end
if(Phoneme==18)
Matrix_train=train.Phonemes18;
end
if(Phoneme==19)
Matrix_train=train.Phonemes19;
end
if(Phoneme==20)
Matrix_train=train.Phonemes20;
end
if(Phoneme==21)
Matrix_train=train.Phonemes21;
end
if(Phoneme==22)
Matrix_train=train.Phonemes22;
end
if(Phoneme==23)
Matrix_train=train.Phonemes23;
end
if(Phoneme==24)
Matrix_train=train.Phonemes24;
end
if(Phoneme==25)
Matrix_train=train.Phonemes25;
end
if(Phoneme==26)
Matrix_train=train.Phonemes26;
end
if(Phoneme==27)
Matrix_train=train.Phonemes27;
end
if(Phoneme==28)
Matrix_train=train.Phonemes28;
end
if(Phoneme==29)
Matrix_train=train.Phonemes29;
end
if(Phoneme==30)
Matrix_train=train.Phonemes30;
end
if(Phoneme==31)
Matrix_train=train.Phonemes31;
end
if(Phoneme==32)
Matrix_train=train.Phonemes32;
end
if(Phoneme==33)
Matrix_train=train.Phonemes33;
end
if(Phoneme==34)
Matrix_train=train.Phonemes34;
end
if(Phoneme==35)
Matrix_train=train.Phonemes35;
end
if(Phoneme==36)
Matrix_train=train.Phonemes36;
end
if(Phoneme==37)
Matrix_train=train.Phonemes37;
end
if(Phoneme==38)
Matrix_train=train.Phonemes38;
end
if(Phoneme==39)
Matrix_train=train.Phonemes39;
end


n=length(Matrix_train);
MFCC=repmat(MFCC,[n,1]);
error=Matrix_train(:,1:39)-MFCC;
mse=sum((error.*error)');
number=[1:n];
array=[mse;number]';
array=sort_array(array,5);
% for i=1:20
%    sentence1(i)=Matrix_train(array(i),84);
%    frame1(i)=Matrix_train(array(i),85);
%     
%     
% end
j=1;
minimum=0;
if(sum(prev_aam)==0)
   % send even the Matrix_train to reduce the number of variable
   sentence= Matrix_train(array(j),84);
   frame=Matrix_train(array(j),85);
   aam=Matrix_train(array(j),40:83);
else
    temp=Matrix_train(array,:);
    n=size(temp);
    prev_aam=repmat(prev_aam,[n(1),1]);
    error=Matrix_train(array,40:83)-prev_aam;
    mse=sum((error.*error)');
    number=[1:n(1)];
    mse=[mse;number]';
    minimum=sort_array(mse,1);
    sentence= Matrix_train(array(minimum),84);
    frame=Matrix_train(array(minimum),85);
    aam=Matrix_train(array(minimum),40:83);

end








end