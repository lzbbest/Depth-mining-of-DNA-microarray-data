[filename,pathname]=uigetfile('file.xls','aaa');
M = xlsread([pathname,filename],'Sheet1','B2:Q19770');
[filename,pathname]=uigetfile('file.xls','aaa');
A = xlsread([pathname,filename],'Sheet1','B2:Q19770');
clearvars filename pathname;
M3=[];
k=1;
while k<=16
    b=robustfit(A(:,k),M(:,k),'ols');%普通最小二乘法
    tempM=b(2)*A(:,k)+b(1);
    tempM=M(:,k)-tempM;
    M3=[M3,tempM];
    k=k+1;
end
clearvars k tempM;
xlswrite('M3.xls',M3,1,'B2:Q19770');