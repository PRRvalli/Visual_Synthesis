function new_output=predict_output1(X,subject,train)
sentence=[num2str(X) '.mat'];
images=20;
%train=load(['/home/prr/intern/database/Phonemes_abhishek_train2.mat']);
%train=load(['/home/prr/intern/database/Phonemes' subject '_good_sen.mat']);
A=load(['/home/prr/intern/Valli/mats_final/' subject '/' sentence]);
MFCC=A.finalstruct.MFCC;
Phonemes=A.finalstruct.Phonemes;

sen=[];
frame=[];
if(length(Phonemes)==length(MFCC))
n=length(Phonemes);
elseif(length(MFCC)>0)
n=length(MFCC);
end
    
    
    P=Phonemes(1);
    [aam array(1,:)]=AAM_selectionV2(P,MFCC(1,:),train,images);
    
    prev=mean_centre(aam);
for i=2:n
    
    P=Phonemes(i);
    [aam array(i,:)]=AAM_selectionV2(P,MFCC(i,:),train,images);
    current=mean_centre(aam);
    
mse(i-1,:)=error_calculator(prev,current);
prev=current;
end

%% combination of AAM with minimum loss 

no_aam=images;
no_frames=length(mse(:,1));

% mse is available 
% minimum's position
position_matrix=[];
pos=[];


s=size(mse);
C=[];
err=[];
C(1,:)=zeros(1,no_aam);

for i=1:no_aam
start(i)=1+no_aam*(i-1);
stop(i)=no_aam*i;
end
i=1;
for i=1:no_frames

     for j=1:no_aam
         %k=ceil(j/5);
         %err(i,start(j):stop(j))=C(i,:)+mse(i,start(j):stop(j));
          err(i,start(j):stop(j))=C(1,:)+mse(i,start(j):stop(j));   
     end
     j=1;
     for j=1:no_aam
        temp=err(i,start(j):stop(j));
        [vv ii]=min(temp);
        %C(i+1,j)=vv;
        C(1,j)=vv;
        pos(i,j)=ii(1);
%         num=[1:no_aam];
%         pos2=sort_array([temp;num]',1);
     end
      
end


[low_cost,index]=min(C);
position=zeros(1,no_frames+1);
position(no_frames+1)=index;
i=1;
for i=1:no_frames
    
    index=pos(no_frames+1-i,index);
    position(no_frames+1-i)=index;
end

% we have the array position and the Phoneme number which is more than
% enough to get the corresponding aam using the position(low cost path)
i=1;
output=[];
for i=1:no_frames+1
    Matrix_train=[];
    if(Phonemes(i)==1)
    Matrix_train=train.Phonemes1;
    end
    if(Phonemes(i)==2)
    Matrix_train=train.Phonemes2;
    end
    if(Phonemes(i)==3)
    Matrix_train=train.Phonemes3;
    end
    if(Phonemes(i)==4)
    Matrix_train=train.Phonemes4;
    end
    if(Phonemes(i)==5)
    Matrix_train=train.Phonemes5;
    end
    if(Phonemes(i)==6)
    Matrix_train=train.Phonemes6;
    end
    if(Phonemes(i)==7)
    Matrix_train=train.Phonemes7;
    end
    if(Phonemes(i)==8)
    Matrix_train=train.Phonemes8;
    end
    if(Phonemes(i)==9)
    Matrix_train=train.Phonemes9;
    end
    if(Phonemes(i)==10)
    Matrix_train=train.Phonemes10;
    end
    if(Phonemes(i)==11)
    Matrix_train=train.Phonemes11;
    end
    if(Phonemes(i)==12)
    Matrix_train=train.Phonemes12;
    end
    if(Phonemes(i)==13)
    Matrix_train=train.Phonemes13;
    end
    if(Phonemes(i)==14)
    Matrix_train=train.Phonemes14;
    end
    if(Phonemes(i)==15)
    Matrix_train=train.Phonemes15;
    end
    if(Phonemes(i)==16)
    Matrix_train=train.Phonemes16;
    end
    if(Phonemes(i)==17)
    Matrix_train=train.Phonemes17;
    end
    if(Phonemes(i)==18)
    Matrix_train=train.Phonemes18;
    end
    if(Phonemes(i)==19)
    Matrix_train=train.Phonemes19;
    end
    if(Phonemes(i)==20)
    Matrix_train=train.Phonemes20;
    end
    if(Phonemes(i)==21)
    Matrix_train=train.Phonemes21;
    end
    if(Phonemes(i)==22)
    Matrix_train=train.Phonemes22;
    end
    if(Phonemes(i)==23)
    Matrix_train=train.Phonemes23;
    end
    if(Phonemes(i)==24)
    Matrix_train=train.Phonemes24;
    end
    if(Phonemes(i)==25)
    Matrix_train=train.Phonemes25;
    end
    if(Phonemes(i)==26)
    Matrix_train=train.Phonemes26;
    end
    if(Phonemes(i)==27)
    Matrix_train=train.Phonemes27;
    end
    if(Phonemes(i)==28)
    Matrix_train=train.Phonemes28;
    end
    if(Phonemes(i)==29)
    Matrix_train=train.Phonemes29;
    end
    if(Phonemes(i)==30)
    Matrix_train=train.Phonemes30;
    end
    if(Phonemes(i)==31)
    Matrix_train=train.Phonemes31;
    end
    if(Phonemes(i)==32)
    Matrix_train=train.Phonemes32;
    end
    if(Phonemes(i)==33)
    Matrix_train=train.Phonemes33;
    end
    if(Phonemes(i)==34)
    Matrix_train=train.Phonemes34;
    end
    if(Phonemes(i)==35)
    Matrix_train=train.Phonemes35;
    end
    if(Phonemes(i)==36)
    Matrix_train=train.Phonemes36;
    end
    if(Phonemes(i)==37)
    Matrix_train=train.Phonemes37;
    end
    if(Phonemes(i)==38)
    Matrix_train=train.Phonemes38;
    end
    if(Phonemes(i)==39)
    Matrix_train=train.Phonemes39;
    end
    
    place=array(i,position(i));
    % output(i,:)=Matrix_train(place,:);
    output(i,:)=Matrix_train(place,40:83);
    out_sen(i)=Matrix_train(place,84);
    out_fram(i)=Matrix_train(place,85);
    out_type(i)=Matrix_train(place,86);
    
    
    
    
end

new_output=mean_centre(output);

% [b,a] = butter(6,(freq/50));
% dataOut=[];
% for i=1:44
% dataOut(:,i) = filtfilt(b,a,new_output(:,i));
% end
% new_output=dataOut;
end