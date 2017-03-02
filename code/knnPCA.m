%%
[m,n]=size(allsvu);
sumsum=[];
for i=1:50
temp_data=allsvu(:,1:i);
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
clearvars cv_temp indices k M N test;