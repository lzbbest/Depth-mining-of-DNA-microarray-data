%%
%示例1
num = xlsread('1.xls')

%%
%示例2
num = xlsread('1.xls',-1)

%%
%示例3
num = xlsread('1.xls','sheet1')

%%
%示例4
num = xlsread('1.xls','A1:B3')

%%
%示例5
num = xlsread('1.xls','sheet1','A1:B3')

%%
%示例6
[num, txt]= xlsread('1.xls','sheet1')

%%
%示例7：将下列name和M数组中的数据写入1.xls文件中
name={'x坐标' 'y坐标'}; M=[1 2;3 4;5 6;7 8];
xlswrite('1.xls',name,'sheet1','A1:B1'); 
xlswrite('1.xls',M,'sheet1','A2:B5'); 

%%
%示例8：动态生成range字符串
beginNum=5;
endNum=18;
dataRange=strcat('A',num2str(beginNum),':','E',num2str(endNum));
xlswrite('myfile.xls',name,'sheet1',dataRange);
web -browser http://www.ilovematlab.cn/thread-122120-1-1.html
