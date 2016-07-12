function new_aam=mean_centre(aam)
mean_x=mean(aam(:,1:22)');
mean_y=mean(aam(:,23:44)');
mean_x=repmat(mean_x',[1,22]);
mean_y=repmat(mean_y',[1,22]);
center=[mean_x,mean_y];
new_aam=aam-center;
end

