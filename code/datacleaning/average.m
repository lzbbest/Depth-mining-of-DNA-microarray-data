 %% Import the data
[filename,pathname]=uigetfile('file.xls','aaa');
[~, ~, raw] = xlsread([pathname,filename],'Sheet1','A2:T43009');
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
cellVectors = raw(:,1);
raw = raw(:,[2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]);

%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
data = reshape([raw{:}],size(raw));
NAME = cellVectors(:,1);
all = data(:,1:19);

%% Clear temporary variables
clearvars data raw cellVectors R filename pathname;

NAME=cellfun(@(x){num2str(x)},NAME);%类型转换
%all=cell2mat(all);

k=1;
while k<=length(NAME)
    [i,j] = find(strcmp(NAME,NAME(k)));
    repeat=i(2:length(i));
    if ~isempty(repeat)
        NAME(repeat)=[];         %NAME重复值置空    
        [i1,j1]=find(~isnan(all(i,:)));
         i1=i(i1);                 %保留原始行信息***********
        fenmu=[]; fenzi=[];
            for x=1:19          %列循环求均值
                [i2,j2]=find(j1==x);
                i2=i1(i2);          %保留原始行信息***********
                if isempty(i2)
                   fenmu=[fenmu,NaN];
                    fenzi=[fenzi,NaN]; 
                else
                    number=length(i2);
                    he=sum(all(i2,x));
                    fenmu=[fenmu,number];
                    fenzi=[fenzi,he];
                end
            end
            %m=mean(all(i,1:19));     %取重复项均值                  
            m=fenzi./fenmu;
        all(k,:)=m;         %矩阵赋值为均值
        all(repeat,:)=[];        %数值重复项置空
    end
k=k+1;
end

[row,col]=size(NAME);
row=num2str(row);
Range1=strcat('A2',':','A',row);
Range2=strcat('B2',':','Q',row);
xlswrite('M2.xls',NAME,1,Range1);
xlswrite('M2.xls',all,1,Range2);

clearvars he i i1 i2 j j1 j2 m number repeat x y k;