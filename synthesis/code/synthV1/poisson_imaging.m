function I=poisson_imaging(b_lip,lip,background,image)
background=double(background);
image=double(image);

[Lh Lv] = imgrad(background);
[Gh Gv] = imgrad(image);

X = background;
Fh = Lh;
Fv = Lv;

h=140;
w=200;
b_h=180;
b_w=240;

GY=lip(1)-70;GX=lip(2)-105;
LY=b_lip(1)-70;LX=b_lip(2)-105;
ly=LY-20;
lx=LX-20;
% backgroud image's lip swapped new lip vice-versa for gradiant  
X(LY:LY+h,LX:LX+w,:) = image(GY:GY+h,GX:GX+w,:);
Fh(LY:LY+h,LX:LX+w,:) = Gh(GY:GY+h,GX:GX+w,:);
Fv(LY:LY+h,LX:LX+w,:) = Gv(GY:GY+h,GX:GX+w,:);

% mask 
msk = zeros(size(X));
msk(LY:LY+h,LX:LX+w,:) = 1;
Y=X;
tic
Y(ly:ly+b_h,:,:) = PoissonJacobi( X(ly:ly+b_h,:,:), Fh(ly:ly+b_h,:,:), Fv(ly:ly+b_h,:,:),msk(ly:ly+b_h,:,:));
toc
tic
Y(ly:ly+b_h,:,:) = PoissonGaussSeidel( X(ly:ly+b_h,:,:), Fh(ly:ly+b_h,:,:), Fv(ly:ly+b_h,:,:),msk(ly:ly+b_h,:,:));

% Y(ly:ly+b_h,lx:lx+b_w,:) = PoissonGaussSeidel( X(ly:ly+b_h,lx:lx+b_w,:), Fh(ly:ly+b_h,lx:lx+b_w,:), Fv(ly:ly+b_h,lx:lx+b_w,:), msk(ly:ly+b_h,lx:lx+b_w,:) );
 toc
I=uint8(Y);
end







