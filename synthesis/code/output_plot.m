% output  
close all
load('Result/3p3m.mat')
load('40_test_3p3m.mat')
x=[1:14 1 15:22 15];
y=[23:36 23 15+22:44 15+22];
for i=1:403
plot(pos(i,x),pos(i,y),'b')
%hold on 
%plot(Output_feature(i,x),Output_feature(i,y),'r')
axis([-2 +2 -1.5 1.5])
pause(0.05)
hold off
end
