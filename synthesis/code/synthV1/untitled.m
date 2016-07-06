clear

tic
list_rec=dir('/home/prr/intern/Abhishek/AAM/Rec*');
n1=length(list_rec);

c=1;C=[];total=0;
available_sen=[];


for i=1:n1

list_sen_dir=dir(['/home/prr/intern/Abhishek/AAM/' list_rec(i).name '/s*' ]);
n2=length(list_sen_dir);
for j=1:n2
y=0;
%disp([list_rec(i).name '-' list_sen_dir(j).name '....'])    
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


% give the indication if sentence exist and the corresponding number of frames 
x=getexist(k,'Abhishek');
if(x==1)

    if(n4>n5)
      type=1;
    elseif(n4==n5)
      type=1;
    else
      type=2;
    end

    % getfeatures
    [f,Phonemes,MFCC,AAM]=getfeature(sentence,subject);
    if(type==1)
      % type=1
      if((n4>f)&&(f>0))
          
      end
    else
    % type=2
      if((n5>f)&&(f>0))
          
      end
    end
end

end
end


toc