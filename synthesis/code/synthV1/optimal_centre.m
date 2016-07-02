
function lip=optimal_centre(I,subject)
[lip bbox]=getface_cord(I,['conf_' subject '.txt']);
c_image=I;
I=rgb2hsv(I);

% s-start e-end
p_lip=lip;
c_lip=[0 0];
for rec=1:4
    if(sum(p_lip-c_lip)~=0)
    %disp(['iteration-' num2str(rec)]);    
    max_limit=bbox(2)+bbox(4);
    s_col=bbox(1);
    e_col=bbox(1)+bbox(3);
        if(lip(1)+80<max_limit)
            s_row=lip(1)-60;

            e_row=lip(1)+60;
        else
            lim=max_limit-lip(1);
            s_row=lip(1)-lim;
            e_row=max_limit;
        end
    %imshow(I(s_row:e_row,s_col:e_col,1))
    pos_row=[];
    pos_col=[];
        for row=s_row:e_row
           for col=s_col:e_col
               if(I(row,col,1)>0.9)
                 pos_row=[pos_row row];
                 pos_col=[pos_col col];
               end
           end
        end 
    p_lip=lip;
    lip=round([mean(pos_row) mean(pos_col)]);
    c_lip=lip; 
    end
end
  %figure;
%   imshow(c_image)
%   hold on
%   rectangle('Position',[lip(2)-90,lip(1)-70,180,140])
%   hold on
%   plot(lip(2),lip(1),'*', 'markersize', 30)
  %pause(1);
% I(lip(i,1)-80:lip(i,1)+80,bbox(i,1):bbox(i,1)+bbox(i,3),:)
% I(bbox(i,2):bbox(i,2)+bbox(i,4),bbox(i,1):bbox(i,1)+bbox(i,3),:)
end