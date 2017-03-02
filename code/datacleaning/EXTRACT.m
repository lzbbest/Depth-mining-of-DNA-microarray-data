%% Import data from text file.
list=dir('E:\Program Files\MATLAB\MATLAB Production Server\R2015a\bin\DEMO\test\*.txt');
for NO=1:length(list)
  filename= strcat ('E:\Program Files\MATLAB\MATLAB Production Server\R2015a\bin\DEMO\test\', list(NO).name);
 
%filename = 'E:\Program Files\MATLAB\MATLAB Production Server\R2015a\bin\DEMO\1.txt';
delimiter = '\t';
startRow = 2;

%% Format string for each line of text:
%   column9: text (%q)
%	column39: double (%f)
%   column45: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%*q%*q%*q%*q%*q%*q%*q%*q%q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%f%*q%*q%*q%*q%*q%f%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines' ,startRow-1, 'ReturnOnError', false);
%% Close the text file.
fclose(fileID);
%% Allocate imported array to column variable names
Name = dataArray{:, 1};
G = dataArray{:, 2};
R = dataArray{:, 3};
Name=cellfun(@(x){num2str(x)},Name);

[i,j]=find(G<50);G(i)=nan;      %deal with weak signal 
[i,j]=find(R<50);R(i)=nan;

if NO==1
    totalName=Name;
    totalR=R;
    totalG=G;
else
    k=1;
    while k<=length(totalG)         %遍历动态数组
        if ~(strcmp(totalName(k),Name(k)))
            [i,j] = find(strcmp(totalName, Name(k)));
            if ~isempty([i,j])
                temp=Name(k);
                Name(k)=Name(i(1));
                Name(i(1))=temp;
                temp2=[G(k),R(k)];
                G(k)=G(i(1));
                G(i(1))=temp2(1);
                R(k)=R(i(1));
                R(i(1))=temp2(2);
            else
                Name(k)=[];G(k)=[];R(k)=[];
                totalName(k)=[];totalG(k,:)=[];totalR(k,:)=[];
            end
        end
        k=k+1;
    end
    totalG=[totalG,G];
    totalR=[totalR,R];    
end
%% Clear temporary variables

end
column=[];
%%M,DELETE ROW AND COL
%M=log(totalR./totalG);%第一次求M
M=0.5*log(totalR.*totalG);%第二次求A
k=1;%delete col
while k<=length(M(1,:))
    [i,j]=find(isnan(M(:,k)));
    if length(i)/length(M(:,k))>0.6
        M(:,k)=[];
        column=[column,k];                  %record column deleted
        k=k-1;                              %repeat search the same row or col*******
    end
    k=k+1;
end

k=1;%delete unqualified row
while k<=length(Name)
    [i,j]=find(isnan(M(k,:)));
    if length(i)>9
        M(k,:)=[];
        Name(k,:)=[];
        k=k-1;
    end
    k=k+1;
end


k=1;%supply NaN
while k<=length(Name)
    i=find(~isnan(M(k,:)));
    mean1=mean(M(k,i));
    j=find(isnan(M(k,:)));
    M(k,j)=mean1;
    k=k+1;
end

%%OUTPUT
[row,col]=size(M);
character={'B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T'};
colll=character(col);
row=num2str(row);col=num2str(col);
Range1=strcat('A2',':','A',row);
Range2=strcat('B2',':',colll,row);
Range2=cell2mat(Range2);
xlswrite('a.xls',Name,1,Range1);
xlswrite('a.xls',M,1,Range2);
clearvars filename delimiter startRow formatSpec fileID dataArray ans k i j;