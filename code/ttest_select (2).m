%%1����k���ڽ���n��������֤  
%2����t�����ҵ��Ĳ�����������pca��ά������ɷֹ��������ռ䣬����ѵ����������k���ڣ������в��ԣ�׼ȷ�ʵ�ָ���ʾ����
%Ȼ��ͼ��ʾ����������꣬��ʾǰ���ٸ����������������ɷ֣��������ʾ׼ȷ�ʵ�����ָ�꣩��
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