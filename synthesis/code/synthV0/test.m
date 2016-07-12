I2=imread('test_male.png');
I2=rgb2gray(I2);
for i=1:size(I2,1)
    for j=1:size(I2,2)
if(I2(i,j)<200)
    I2(i,j)=10;
end
    end
end
imshow(I2)

I_left=down_col(I(:,1:110),60);
I_left=down_row(I_left,40);
imshow(I_left)
I2(160:219,231:270)=I_left;
I2(231:270,160:219)=I_left;
imshow(I)
I_right=down_col(I(:,159:end),60);
I_right=down_row(I_right,40);
imshow(I2)
I2(238:277,280:339)=I_right;
imshow(I2)
imshow(I2)
imwrite(I2,'closed_eye.png');
