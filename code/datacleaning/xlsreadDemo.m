%%
%ʾ��1
num = xlsread('1.xls')

%%
%ʾ��2
num = xlsread('1.xls',-1)

%%
%ʾ��3
num = xlsread('1.xls','sheet1')

%%
%ʾ��4
num = xlsread('1.xls','A1:B3')

%%
%ʾ��5
num = xlsread('1.xls','sheet1','A1:B3')

%%
%ʾ��6
[num, txt]= xlsread('1.xls','sheet1')

%%
%ʾ��7��������name��M�����е�����д��1.xls�ļ���
name={'x����' 'y����'}; M=[1 2;3 4;5 6;7 8];
xlswrite('1.xls',name,'sheet1','A1:B1'); 
xlswrite('1.xls',M,'sheet1','A2:B5'); 

%%
%ʾ��8����̬����range�ַ���
beginNum=5;
endNum=18;
dataRange=strcat('A',num2str(beginNum),':','E',num2str(endNum));
xlswrite('myfile.xls',name,'sheet1',dataRange);
web -browser http://www.ilovematlab.cn/thread-122120-1-1.html
