%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: E:\Program Files\MATLAB\MATLAB Production Server\R2015a\bin\DEMO\OUTA.xls
%    Worksheet: Sheet1
%
% To extend the code for use with different selected data or a different
% spreadsheet, generate a function instead of a script.

% Auto-generated by MATLAB on 2016/02/27 19:50:02

%% Import the data
[~, ~, raw] = xlsread('E:\Program Files\MATLAB\MATLAB Production Server\R2015a\bin\DEMO\OUTA.xls','Sheet1','A2:T43009');
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
cellVectors = raw(:,1);
raw = raw(:,[2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]);

%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Allocate imported array to column variable names
NAME = cellVectors(:,1);
VarName2 = data(:,1);
VarName3 = data(:,2);
VarName4 = data(:,3);
VarName5 = data(:,4);
VarName6 = data(:,5);
VarName7 = data(:,6);
VarName8 = data(:,7);
VarName9 = data(:,8);
VarName10 = data(:,9);
VarName11 = data(:,10);
VarName12 = data(:,11);
VarName13 = data(:,12);
VarName14 = data(:,13);
VarName15 = data(:,14);
VarName16 = data(:,15);
VarName17 = data(:,16);
VarName18 = data(:,17);
VarName19 = data(:,18);
VarName20 = data(:,19);

%% Clear temporary variables
clearvars data raw cellVectors R;

% for k=1:
% [i,j] = find(strcmp(, ));