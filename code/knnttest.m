%2）用t检验找到的差异表达基因或者pca降维后的主成分构建特征空间，进行训练分类器（k近邻）并进行测试（准确率等指标表示），
%%然后画图表示结果（横坐标，表示前多少个差异表达基因或者主成分；纵坐标表示准确率等评价指标）。
[m,n]=size(data);
data=data';
sumsum=[];
for i=1:m
temp_data=data(:,1:i);
[M,N]=size(temp_data);
indices=crossvalind('Kfold',label,13);
cv=0;
for j=1:13                         %交叉验证k=13，13个包轮流作为测试集
        test = (indices == j);      %获得test集元素在数据集中对应的单元编号
        train = ~test;              %train集元素的编号为非test元素的编号
        train_data=temp_data(train,:);   %从数据集中划分出train样本的数据
        train_label=label(train,:); %获得样本集的测试目标，在本例中是实际分类情况
        test_data=temp_data(test,:); %test样本集
        test_label=label(test,:);
k=knnclassify(test_data,train_data,train_label,3,'euclidean','random');
cv_temp=length(test_label)\length(find(test_label==k));
cv=cv+cv_temp;
end
cv=cv/13;
sumsum=[sumsum,cv];
end
%x=[1:683];
%simple=tsmovavg(sumsum,'s',10,2);%简单移动平均法剔除随机波动，使序列变得比较平滑，以反映出其基本轨迹
%plot(x,sumsum,x,simple)
clearvars cv_temp indices k M N test;