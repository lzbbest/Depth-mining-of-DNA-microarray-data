%2����t�����ҵ��Ĳ�����������pca��ά������ɷֹ��������ռ䣬����ѵ����������k���ڣ������в��ԣ�׼ȷ�ʵ�ָ���ʾ����
%%Ȼ��ͼ��ʾ����������꣬��ʾǰ���ٸ����������������ɷ֣��������ʾ׼ȷ�ʵ�����ָ�꣩��
[m,n]=size(data);
data=data';
sumsum=[];
for i=1:m
temp_data=data(:,1:i);
[M,N]=size(temp_data);
indices=crossvalind('Kfold',label,13);
cv=0;
for j=1:13                         %������֤k=13��13����������Ϊ���Լ�
        test = (indices == j);      %���test��Ԫ�������ݼ��ж�Ӧ�ĵ�Ԫ���
        train = ~test;              %train��Ԫ�صı��Ϊ��testԪ�صı��
        train_data=temp_data(train,:);   %�����ݼ��л��ֳ�train����������
        train_label=label(train,:); %����������Ĳ���Ŀ�꣬�ڱ�������ʵ�ʷ������
        test_data=temp_data(test,:); %test������
        test_label=label(test,:);
k=knnclassify(test_data,train_data,train_label,3,'euclidean','random');
cv_temp=length(test_label)\length(find(test_label==k));
cv=cv+cv_temp;
end
cv=cv/13;
sumsum=[sumsum,cv];
end
%x=[1:683];
%simple=tsmovavg(sumsum,'s',10,2);%���ƶ�ƽ�����޳����������ʹ���б�ñȽ�ƽ�����Է�ӳ��������켣
%plot(x,sumsum,x,simple)
clearvars cv_temp indices k M N test;