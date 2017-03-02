%%
r1=randperm(21);r1=r1(1:2);%随机数产生，各选择1/10作为测试样本
r2=randperm(31);r2=r2(1:3);
TrainNormal=normal;TrainNormal(:,r1)=[];%选择训练集测试集
TrainPatient=patient;TrainPatient(:,r2)=[];
TestNormal=normal(:,r1);
TestPatient=patient(:,r2);
%% select feature gene by ways of Ttest
[h,p]=ttest2(TrainNormal,TrainPatient,0.001,'right','unequal',2);
i3=find(p<0.001);
p3=p(i3,:);
TrainNormal=TrainNormal(i3,:);
TrainPatient=TrainPatient(i3,:);
TestNormal=TestNormal(i3,:);
TestPatient=TestPatient(i3,:);

TrainData=[p3,TrainNormal,TrainPatient];
TestData=[p3,TestNormal,TestPatient];
%TrainData=sort(TrainData,1);
%TestData=sort(TestData,1);
TrainData(:,1)=[];
TestData(:,1)=[];
a=zeros(19,1);b=ones(28,1);
TrainLabel=[a;b];
TestLabel=[0 0 1 1 1];
clearvars i3 h p a b i p3 r1 r2;