function coef=corr_factor(Actual,predicted)
std_actual=std(Actual);
std_pred=std(predicted);
n=length(Actual);
mean_actual=mean(Actual);
mean_predicted=mean(predicted);
Actual=Actual-mean_actual;
predicted=predicted-mean_predicted;
coef=sum(Actual.*predicted)/(n*std_actual*std_pred);



end
