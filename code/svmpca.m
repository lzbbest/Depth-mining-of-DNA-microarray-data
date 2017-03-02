%This script do train and Cross Validate an SVM Classifie
[m,n]=size(allsvu);
%[m,n]=size(data);
%data=data';
allsvu=allsvu';
sumsum=[];
for i=1:m
%[M,N]=size(data);
temp_data=allsvu(:,1:i);
SVMModel = fitcsvm(temp_data,label);
CVSVMModel = crossval(SVMModel,'kfold',13);
cv = kfoldLoss(CVSVMModel);
sumsum=[sumsum,cv];
end
sum=1-sumsum;