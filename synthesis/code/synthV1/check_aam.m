clear

tic
list_rec=dir('/home/prr/intern/Abhishek/AAM/Rec*');
n1=length(list_rec);
%fileID = fopen('/home/prr/intern/Valli/Abhishek_list_5.txt','w');
c=1;C=[];total=0;
available_sen=[];

%fprintf(fileID,'%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n','sen_num','total','type-1','type-2','frame','diff','exist','match');
for i=1:n1

list_sen_dir=dir(['/home/prr/intern/Abhishek/AAM/' list_rec(i).name '/s*' ]);
n2=length(list_sen_dir);
for j=1:n2
y=0;
disp([list_rec(i).name '-' list_sen_dir(j).name '....'])    
list_sen_image1=dir(['/home/prr/intern/Abhishek/AAM/' list_rec(i).name '/' list_sen_dir(j).name '/*.jpg']);
k=getsentence(list_rec(i).name,list_sen_dir(j).name);
[rec,sen]=getvalue(list_rec(i).name,list_sen_dir(j).name);
list_sen_image2=dir(['/home/prr/intern/Abhishek/AAM/' list_rec(i).name '/' list_sen_dir(j).name '/out' num2str(k) '*.jpg']);
list_sen_image3=dir(['/home/prr/intern/Abhishek/AAM/' list_rec(i).name '/' list_sen_dir(j).name '/out' num2str(rec) '_' num2str(sen) '_' '*.jpg']);
% total images
n3=length(list_sen_image1);
% type-1 images
n4=length(list_sen_image2);
%type-2 images
n5=length(list_sen_image3);
if((n3-(n4+n5))~=0)
C(c)=k;c=c+1;
end

% give the indication if sentence exist and the corresponding number of frames 
[x,f]=sentence_exist(k,'Abhishek');
% if(x==1)
% total=total+1;    
% end
if(n4>n5)
      type=1;
    elseif(n4==n5)
      type=1;
    else
      type=2;
    end
% checks whether frames are matching with image or not
if(((n4>=f)&&(n4>0))||((n5>=f)&&(n5>0)))
   if(f>0)
    y=1 ;
   else
       y=0;
   end
else
    y=0;
end
% total number of frames that are matching
if(y==1)
total=total+1; 
available_sen(total,1)=k;
available_sen(total,2)=type;
end
% sentence_number  total_image  type-1 type-2 missing availablity frames
% missing_frames
% if(f>0)&&(y==0)
% fprintf(fileID,'%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\n',k,n3,n4,n5,f,(n3-(n4+n5)),x,y);
% end
end
end

%fclose(fileID);
toc