folder='/media/prr/PRR/AAM_Niranjana/AAM/';
subject='Niranjana';
list_rec=dir([folder 'Rec*']);
n1=length(list_rec);
fileID=fopen(['/home/prr/intern/Valli/' subject '_good.txt'],'w');
available_sen=[];
number=1;
for i=1:n1
    disp([list_rec(i).name])
    list_sen_dir=dir([folder list_rec(i).name '/s*' ]);

    n2=length(list_sen_dir);
    for j=1:n2
        y=0;
        
        list_sen_image1=dir([folder list_rec(i).name '/' list_sen_dir(j).name '/*.jpg']);
        k=getsentence(list_rec(i).name,list_sen_dir(j).name);
        [rec,sen]=getvalue(list_rec(i).name,list_sen_dir(j).name);
        list_sen_image2=dir([folder list_rec(i).name '/' list_sen_dir(j).name '/out' num2str(k) '*.jpg']);
        list_sen_image3=dir([folder list_rec(i).name '/' list_sen_dir(j).name '/out' num2str(rec) '_' num2str(sen) '_' '*.jpg']);
        % total images
        n3=length(list_sen_image1);
        % type-1 images
        n4=length(list_sen_image2);
        %type-2 images
        n5=length(list_sen_image3);
        %         x=getexist(k,subject);
        %         if(x==1)
        %         [f,Phonemes,MFCC,AAM]=getfeature(k,subject);
        %         else
        %         f=0;    
        %         end
        %         fprintf(fileID,'%s\t%d\t%d\t%d\t%d\t%d\n',list_rec(i).name,k,n3,n4,n5,f);
        x=getexist(k,subject);
        if(x==1)

            if(n4>n5)
              type=1;
            elseif(n4==n5)
              type=1;
            else
              type=2;
            end

            % getfeatures
            [f,Phonemes,MFCC,AAM]=getfeature(k,subject);
            if(type==1)
              % type=1
              if((n4>f)&&(f>0))
                fprintf(fileID,'%d\t%d\t%d\t%d\t%d\n',k,n3,n4,f,type);
                available_sen(number,1)=k;
                available_sen(number,2)=type;
                number=number+1;
              end
            else
            % type=2
              if((n5>f)&&(f>0))
                fprintf(fileID,'%d\t%d\t%d\t%d\t%d\n',k,n3,n5,f,type);
                available_sen(number,1)=k;
                available_sen(number,2)=type;
                number=number+1;
              end
            end
        end
    end
end
fclose(fileID);