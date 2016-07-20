function [c]=alignment(AAM)
x=[23:36 23];
y=[1:14 1];
coor=[AAM(1,x);AAM(1,y)];
theta=atan((-AAM(1,9)+AAM(1,1))/(AAM(1,9+22)-AAM(1,1+22)));
%theta=-theta;
mat=[cos(theta) -sin(theta);sin(theta) cos(theta)];
outer=mat*coor;
x1=[37:44 37];
y1=[15:22 15];
inner_lip=[AAM(1,x1);AAM(1,y1)];
theta=atan((-AAM(1,19)+AAM(1,15))/(AAM(1,19+22)-AAM(1,15+22)));
%theta=-theta;
mat=[cos(theta) -sin(theta);sin(theta) cos(theta)];
inner=mat*inner_lip;
% plot(outer(1,:),-outer(2,:))
% hold on
% plot(inner(1,:),-inner(2,:))
% hold on
% plot(AAM(1,x),-AAM(1,y))
% hold on
% plot(AAM(1,x1),-AAM(1,y1))
c=[outer(2,1:14) inner(2,1:8) outer(1,1:14) inner(1,1:8)];

end