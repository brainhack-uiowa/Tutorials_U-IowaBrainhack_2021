% paths displayed in purple will be changed based on your computer's
% configuration and directory setup
% on July 2nd we will cover the eeglab GUI and only touch on code
% components
clc; clear; % clear workspace and command window 
addpath('YOURPATH/eeglab2021.0');  %add eeglab to the path
addpath('YOURPATH/finalData/'); % add data to path
temp = dir(['YOURPATH/finalData/*.set']);
files = {temp.name}; % pull out the names of individual data files within temp
folder = 'YOURPATH/finalData/';
number_of_subjects = length(files); % define number of subjects

eeglab % open eeglab
% load in data using eeglab function pop_loadset()
EEG = pop_loadset('YOURPATH/finalData/sub7.set') 