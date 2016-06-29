% output  
close all
load('/home/prr/intern/Valli/mats_final/Result/200_3p3m_PCA_n256_e25')
load('inputs/out_pca_10.mat')
x=[1:14 1 15:22 15];
y=[23:36 23 15+22:44 15+22];
load('eigenvector2.mat');
pos=pos*1004;
Output_feature=Output_feature*1004;
pos=pos*Q';
Output_feature=Output_feature*Q';
center=repmat(center,[length(pos),1]);
pos=pos+center;
Output_feature=Output_feature+center;
for i=1:274
plot(pos(i,x),pos(i,y),'b')
hold on 
%plot(Output_feature(i,x),Output_feature(i,y),'r')
axis([-300 +300 -300 300])
pause(0.05)
hold off
end
