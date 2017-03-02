%%
rfedata=data(:,sortrfe(1:200));
[m,n]=size(rfedata);
sumsum=[];
for i=1:n
temp_data=rfedata(:,1:i);
indices=crossvalind('Kfold',label,13);
cv=0;
for j=1:13                         %������֤k=13��13����������Ϊ���Լ�
        test = (indices == j);      %���test��Ԫ�������ݼ��ж�Ӧ�ĵ�Ԫ���
        train = ~test;              %train��Ԫ�صı��Ϊ��testԪ�صı��
        train_data=temp_data(train,:);   %�����ݼ��л��ֳ�train����������
        train_label=label(train,:); %����������Ĳ���Ŀ�꣬�ڱ�������ʵ�ʷ������
        test_data=temp_data(test,:); %test������
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