function I=poisson_imaging(h,w,background,image)

background=double(background);
image=double(image);
Lf=imGradFeature(background);
Gf=imGradFeature(image);
Lf(h(1):h(2),w(1):w(2),:,:) = Gf;
% X = Lf(:,:,:,1);

param = buildModPoissonParam( size(Lf) );
I=modPoisson( Lf, param, 1E-8 );
I=uint8(I);

end