%%
rfedata=data(:,sortrfe(1:200));
[m,n]=size(rfedata);
sumsum=[];
for i=1:n
temp_data=rfedata(:,1:i);
indices=crossvalind('Kfold',label,13);
cv=0;
for j=1:13                         %交叉验证k=13，13个包轮流作为测试集
        test = (indices == j);      %获得test集元素在数据集中对应的单元编号
        train = ~test;              %train集元素的编号为非test元素的编号
        train_data=temp_data(train,:);   %从数据集中划分出train样本的数据
        train_label=label(train,:); %获得样本集的测试目标，在本例中是实际分类情况
        test_data=temp_data(test,:); %test样本集
        test_label=label(test,:);
k=knnclassify(test_data,train_data,train_label,3,'cosine','nearest');
cv_temp=length(test_label)\length(find(test_label==k));
cv=cv+cv_temp;
end
cv=cv/13;
sumsum=[sumsum,cv];
end
plot(sumsum);
%acc111=sumsum;
% for i=11:673
%     acc111(i)=mean(sumsum(i-10:i+10));
% end
clearvars cv_temp indices i j k M N test train_data train_label test_data test_label cv;