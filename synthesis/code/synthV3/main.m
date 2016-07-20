% main code
load('2195.mat')
for number=1:length(new_output)
	new_output(number,:)=alignment(new_output(number,:));
end
% just check the coordinates
x=[1:14 1];
y=[23:36 23]; 
x1=[15:22 15];
y1=[37:44 37];
for frame 1:length(new_output)
	plot(new_output(frame,y),-1*new_output(frame,x))
	hold on 
	plot(new_output(frame,y1),-1*new_output(frame,x1))
end
