clear all
subject='Abhishek';

files=dir(['/home/prr/intern/Valli/mats_final/' subject '/*.mat' ]);

P1=1;
P2=1;
P3=1;
P4=1;
P5=1;
P6=1;
P7=1;
P8=1;
P9=1;
P10=1;
P11=1;
P12=1;
P13=1;
P14=1;
P15=1;
P16=1;
P17=1;
P18=1;
P19=1;
P20=1;
P21=1;
P22=1;
P23=1;
P24=1;
P25=1;
P26=1;
P27=1;
P28=1;
P29=1;
P30=1;
P31=1;
P32=1;
P33=1;
P34=1;
P35=1;
P36=1;
P37=1;
P38=1;
P39=1;
%% variable used to store MFCC,AAM(mean centered),sentence
Phonemes1=[];
Phonemes2=[];
Phonemes3=[];
Phonemes4=[];
Phonemes5=[];
Phonemes6=[];
Phonemes7=[];
Phonemes8=[];
Phonemes9=[];
Phonemes10=[];
Phonemes11=[];
Phonemes12=[];
Phonemes13=[];
Phonemes14=[];
Phonemes15=[];
Phonemes16=[];
Phonemes17=[];
Phonemes18=[];
Phonemes19=[];
Phonemes20=[];
Phonemes21=[];
Phonemes22=[];
Phonemes23=[];
Phonemes24=[];
Phonemes25=[];
Phonemes26=[];
Phonemes27=[];
Phonemes28=[];
Phonemes29=[];
Phonemes30=[];
Phonemes31=[];
Phonemes32=[];
Phonemes33=[];
Phonemes34=[];
Phonemes35=[];
Phonemes36=[];
Phonemes37=[];
Phonemes38=[];
Phonemes39=[];
c=0;
count=0;
for K=1:length(files)
    if(count>=1200)
    
        break
    
    else
    A=load(['/home/prr/intern/Valli/mats_final/' subject '/' files(K).name]);
    
    if((length(A.finalstruct.MFCC)~=0)&&(sum(A.finalstruct.AAM_all(:))~=0))
    MFCC=A.finalstruct.MFCC;
    Phonemes=A.finalstruct.Phonemes;
    AAM=A.finalstruct.AAM_all;
    n=length(Phonemes);
    sentence=numreturn(files(K).name);
    %type=available_sen(K,2);
    type=1;
    disp([num2str(K) '...'])
    if(length(MFCC)==n)&&(length(AAM==n))
    count=count+1;
    %c=c+1;  
for i=1:n


if(Phonemes(i)==1)
Phonemes1(P1,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P1=P1+1;
end
if(Phonemes(i)==2)
Phonemes2(P2,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P2=P2+1;
end
if(Phonemes(i)==3)
Phonemes3(P3,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P3=P3+1;
end
if(Phonemes(i)==4)
Phonemes4(P4,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P4=P4+1;
end
if(Phonemes(i)==5)
Phonemes5(P5,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P5=P5+1;
end
if(Phonemes(i)==6)
Phonemes6(P6,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P6=P6+1;
end
if(Phonemes(i)==7)
Phonemes7(P7,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P7=P7+1;
end
if(Phonemes(i)==8)
Phonemes8(P8,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P8=P8+1;
end
if(Phonemes(i)==9)
Phonemes9(P9,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P9=P9+1;
end
if(Phonemes(i)==10)
Phonemes10(P10,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P10=P10+1;
end
if(Phonemes(i)==11)
Phonemes11(P11,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P11=P11+1;
end
if(Phonemes(i)==12)
Phonemes12(P12,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P12=P12+1;
end
if(Phonemes(i)==13)
Phonemes13(P13,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P13=P13+1;
end
if(Phonemes(i)==14)
Phonemes14(P14,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P14=P14+1;
end
if(Phonemes(i)==15)
Phonemes15(P15,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P15=P15+1;
end
if(Phonemes(i)==16)
Phonemes16(P16,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P16=P16+1;
end
if(Phonemes(i)==17)
Phonemes17(P17,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P17=P17+1;
end
if(Phonemes(i)==18)
Phonemes18(P18,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P18=P18+1;
end
if(Phonemes(i)==19)
Phonemes19(P19,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P19=P19+1;
end
if(Phonemes(i)==20)
Phonemes20(P20,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P20=P20+1;
end
if(Phonemes(i)==21)
Phonemes21(P21,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P21=P21+1;
end
if(Phonemes(i)==22)
Phonemes22(P22,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P22=P22+1;
end
if(Phonemes(i)==23)
Phonemes23(P23,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P23=P23+1;
end
if(Phonemes(i)==24)
Phonemes24(P24,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P24=P24+1;
end
if(Phonemes(i)==25)
Phonemes25(P25,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P25=P25+1;
end
if(Phonemes(i)==26)
Phonemes26(P26,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P26=P26+1;
end
if(Phonemes(i)==27)
Phonemes27(P27,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P27=P27+1;
end
if(Phonemes(i)==28)
Phonemes28(P28,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P28=P28+1;
end
if(Phonemes(i)==29)
Phonemes29(P29,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P29=P29+1;
end
if(Phonemes(i)==30)
Phonemes30(P30,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P30=P30+1;
end
if(Phonemes(i)==31)
Phonemes31(P31,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P31=P31+1;
end
if(Phonemes(i)==32)
Phonemes32(P32,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P32=P32+1;
end
if(Phonemes(i)==33)
Phonemes33(P33,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P33=P33+1;
end
if(Phonemes(i)==34)
Phonemes34(P34,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P34=P34+1;
end
if(Phonemes(i)==35)
Phonemes35(P35,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P35=P35+1;
end
if(Phonemes(i)==36)
Phonemes36(P36,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P36=P36+1;
end
if(Phonemes(i)==37)
Phonemes37(P37,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P37=P37+1;
end
if(Phonemes(i)==38)
Phonemes38(P38,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P38=P38+1;
end
if(Phonemes(i)==39)
Phonemes39(P39,:)=[MFCC(i,:) AAM(i,:) sentence i type];
P39=P39+1;
end
end
end
    
    
    
    end
    end
end

save(['/home/prr/intern/database/' subject '_final.mat'],'Phonemes1','Phonemes2','Phonemes3','Phonemes4','Phonemes5','Phonemes6','Phonemes7','Phonemes8','Phonemes9','Phonemes10','Phonemes11','Phonemes12','Phonemes13','Phonemes14','Phonemes15','Phonemes16','Phonemes17','Phonemes18','Phonemes19','Phonemes20','Phonemes21','Phonemes22','Phonemes23','Phonemes24','Phonemes25','Phonemes26','Phonemes27','Phonemes28','Phonemes29','Phonemes30','Phonemes31','Phonemes32','Phonemes33','Phonemes34','Phonemes35','Phonemes36','Phonemes37','Phonemes38','Phonemes39');
%pos=available_sen(K+1:end,:);

%remaining sentence
c=0;test_sentence=[];
for rem=K:length(files)
    
    A=load(['/home/prr/intern/Valli/mats_final/' subject '/' files(rem).name]);
    if((length(A.finalstruct.MFCC)~=0)&&(sum(A.finalstruct.AAM_all(:))~=0))
    MFCC=A.finalstruct.MFCC;
    Phonemes=A.finalstruct.Phonemes;
    AAM=A.finalstruct.AAM_all;
    n=length(Phonemes);
    sentence=numreturn(files(rem).name);
    %type=available_sen(K,2);
    type=1;
    disp([num2str(rem) '...'])
    if(length(MFCC)==n)&&(length(AAM==n))
        c=c+1; 
        test_sentence(c)=sentence;
    end
    end
    
end



