function I=poisson_imaging(h,w,background,image)
background=double(background);
image=double(image);

[Lh Lv] = imgrad(background);
[Gh Gv] = imgrad(image);

X = background;
Fh = Lh;
Fv = Lv;




% backgroud image's lip swapped new lip vice-versa for gradiant  
X(h(1):h(2),w(1):w(2)) = image;
Fh(h(1):h(2),w(1):w(2)) = Gh;
Fv(h(1):h(2),w(1):w(2)) = Gv;

% mask 
msk = zeros(size(X));
msk(h(1):h(2),w(1):w(2)) = 1;
Y=X;
tic
%(h(1)-50:h(2)+50,:)
Y(h(1)-80:h(2)+80,:) = PoissonJacobi( X(h(1)-80:h(2)+80,:), Fh(h(1)-80:h(2)+80,:), Fv(h(1)-80:h(2)+80,:),msk(h(1)-80:h(2)+80,:));
toc
% tic
% Y(h(1)-20:h(2)+20,:) = PoissonGaussSeidel( X(h(1)-20:h(2)+20,:), Fh(h(1)-20:h(2)+20,:), Fv(h(1)-20:h(2)+20,:),msk(h(1)-20:h(2)+20,:));
% toc
% Y(ly:ly+b_h,lx:lx+b_w,:) = PoissonGaussSeidel( X(ly:ly+b_h,lx:lx+b_w,:), Fh(ly:ly+b_h,lx:lx+b_w,:), Fv(ly:ly+b_h,lx:lx+b_w,:), msk(ly:ly+b_h,lx:lx+b_w,:) );

I=uint8(Y);
end







