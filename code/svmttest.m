%%SVM---Matrix of training data, where each row corresponds to an observation or replicate, 
%and each column corresponds to a feature or
%variable.*(row-sample,col-feature value)*
%svmtrain treats NaNs or empty strings in Training as missing values and ignores the corresponding rows of Group.
%train_data=[1 1 1 2 3 2 1 3 0 5 7 5 8 5 9 6 8]';
%train_label=[1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0]';
%test_data=[-1:14 4.1 3.1]';
%SVMStruct = svmtrain(train_data, train_label);
%predict_label  = svmclassify(SVMStruct, test_data);
%%
[m,n]=size(data);
sumsum=[];
for i=1:n
%[M,N]=size(data);
temp_data=data(:,1:i);
SVMModel = fitcsvm(temp_data,label);
CVSVMModel = crossval(SVMModel,'kfold',13);
cv = kfoldLoss(CVSVMModel);
sumsum=[sumsum,cv];
end
sum=1-sumsum;
%x=[1:683];
%simple=tsmovavg(sumsum,'s',10,2);%简单移动平均法剔除随机波动，使序列变得比较平滑，以反映出其基本轨迹
%plot(x,sumsum,x,simple)
clearvars temp_data test i cv sumsum m n;
