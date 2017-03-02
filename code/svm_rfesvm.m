%This script do train and Cross Validate an SVM Classifie
rfedata=data(:,sortrfe(1:200));
[m,n]=size(rfedata);
sumsum=[];
for i=1:n
temp_data=rfedata(:,1:i);
SVMModel = fitcsvm(temp_data,label);
CVSVMModel = crossval(SVMModel,'kfold',13);
cv = kfoldLoss(CVSVMModel);
sumsum=[sumsum,cv];
end
sum=1-sumsum;