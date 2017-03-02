%%1）用k近邻进行n倍交叉验证  
%2）用t检验找到的差异表达基因或者pca降维后的主成分构建特征空间，进行训练分类器（k近邻）并进行测试（准确率等指标表示），
%然后画图表示结果（横坐标，表示前多少个差异表达基因或者主成分；纵坐标表示准确率等评价指标）。
function result = test_select(label, normal,patient)
[h,p]=ttest2(normal,patient,0.01,'right','unequal',2);
i3=find(p<0.001);
p3=p(i3,:);
normal3=normal(i3,:);
patient3=patient(i3,:);
data=[p3,normal3,patient3];
%data=sort(data,1);
data(:,1)=[];
%a=zeros(21,1);b=zeros(31,1);b=b+1;
%label=[a;b];
clearvars i3 h p a b i normal3 patient3;
end