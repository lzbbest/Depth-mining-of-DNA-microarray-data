
%% Initialize variables.
for numnum=2:19%������������
filename=strcat('E:\Program Files\MATLAB\MATLAB Production Server\R2015a\bin\DEMO\',num2str(numnum),'.txt');
%[filename,pathname]=uigetfile('file.txt','aaa');%ͼ�λ�ѡ���ļ�����
%filename = 'E:\Program Files\MATLAB\MATLAB Production Server\R2015a\bin\DEMO\1.txt';
delimiter = '\t';
startRow = 2;

%% Format string for each line of text:
%   column9: text (%q)
%	column58: double (%f)
%   column64: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%*q%*q%*q%*q%*q%*q%*q%*q%q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%f%*q%*q%*q%*q%*q%f%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%[^\n\r]';

%% Open the text file.
%fileID = fopen([pathname,filename],'r');%ͼ�λ�ѡ���ļ�[pathname,filename]�෴
fileID = fopen(filename,'r');

dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines' ,startRow-1, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

Name1 = dataArray{:, 1};
Logbase2ofRGNormalizedRatioMedian = dataArray{:, 2};
OverallIntensityAsqrtRGMedians = dataArray{:, 3};


%% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans;

% ��һ�ζ�ȡ���ݣ�����name����ΪΨһ���
% name=Name1;
% xlswrite('OUTA.xls',Name1,1,'A2:A43009');
% xlswrite('OUTM.xls',Name1,1,'A2:A43009');

%cellfun(@(x){num2str(x)},cell);
%cellfun(@(x){num2str(x)},cell);
for k=1;43008           %�ж�name�Ƿ��Ӧ
    if ~(strcmp(name{k},Name1{k}))
        [i,j] = find(strcmp(Name1, name{k}));
        if ~isempty([i,j])
            temp{1}=name{k};
            temp2(1)=Logbase2ofRGNormalizedRatioMedian(k);
            temp3(1)=OverallIntensityAsqrtRGMedians(k);
            Name1{k}=Name1{i};
            Name1{i}=temp{1};
            Logbase2ofRGNormalizedRatioMedian(k)=Logbase2ofRGNormalizedRatioMedian(i);
            Logbase2ofRGNormalizedRatioMedian(i)=temp2(1);
            OverallIntensityAsqrtRGMedians(k)=OverallIntensityAsqrtRGMedians(i);
            OverallIntensityAsqrtRGMedians(k)=temp3(1);
        else
             Logbase2ofRGNormalizedRatioMedian(k)=NaN;
             OverallIntensityAsqrtRGMedians(k)=NaN;
        end 
    end
end

character={'B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T'};%ÿһ�ж�Ӧһ��оƬ������
dataRange=strcat(character{numnum},num2str(2),':',character{numnum},num2str(43009));

xlswrite('OUTM.xls',Logbase2ofRGNormalizedRatioMedian,1,dataRange);
xlswrite('OUTA.xls',OverallIntensityAsqrtRGMedians,1,dataRange);
end