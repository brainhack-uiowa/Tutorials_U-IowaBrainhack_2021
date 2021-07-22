clc; clear; 
addpath('C:\NFPmatlab\eeglab2021.0');  %add eeglab to the path
addpath('C:/Users/jaxjs/OneDrive/Desktop/hackyhour/matlabTutorials/weeklyLessons/july9th/');
temp = dir(['C:/Users/jaxjs/OneDrive/Desktop/hackyhour/matlabTutorials/weeklyLessons/july9th/*.set']);
files = {temp.name}; % pull out the names of individual data files within the list temp
folder = 'C:/Users/jaxjs/OneDrive/Desktop/hackyhour/matlabTutorials/weeklyLessons/july9th/';
number_of_subjects = length(files);

eeglab
% load in dataset
EEG = pop_loadset('C:/Users/jaxjs/OneDrive/Desktop/hackyhour/matlabTutorials/weeklyLessons/july9th/sub13-final.set')

% pre-assign an array for the epochs
samples_before_event = 500;
samples_after_event = 1000;
% pre-assign matrix to store all individual subject averages
all_averages = zeros(EEG.nbchan, samples_before_event+samples_after_event+1,number_of_subjects);

% make a loop across all subjects
for is = 1:number_of_subjects

   % load subject data
   EEG = pop_loadset(fullfile(folder,files{is}));
   
    % grabbing event types cell array
    eventtypes = {EEG.event.type}; % for char

    % find all events of a certain type
    event200 = find(strcmpi(eventtypes,'WMstimulus')); % for characters
    number_of_epochs = length(event200);

    epoched_data = zeros(EEG.nbchan, samples_before_event+samples_after_event+1,number_of_epochs);

    % baseline time range
    beginbaseline = 200; % sample points before event
    endbaseline = 0; % sample points before event

    % channel of interest: FCz
    channel = 19;

    % make a loop and go through all those events
    for ie = 1:length(event200);

        % current event index in the eventtypes cell array
        current_event = event200(ie);

        % current event latency (sampling point)
        current_latency = EEG.event(current_event).latency;

        % grab data
        edata = EEG.data(:,current_latency - samples_before_event : current_latency+samples_after_event);

        % baseline correction
        bdata = mean(EEG.data(:,current_latency - beginbaseline: current_latency + endbaseline ),2);

        % subtract baseline for each channel   
        edata_minus_bl = zeros(size(edata)); % preassign to same size as edata 
        for ic = 1:size(edata,1)
            edata_minus_bl(ic,:) = edata(ic,:) - bdata(ic,:);
        end

        % store data
        epoched_data(:,:,ie) = edata_minus_bl;
        
    end % of trials

    % calculate subject average across trials
   subject_average = mean(epoched_data,3); % average across the third dimension
   
   % store
   all_averages(:,:,is) = subject_average; % store average

end % of subjects
GA = mean(all_averages,3); % average across third dimension (subjects)

h = figure('Color','w','Position',[1 1 800 600]); 
%subplot(1,3,1); hold; % (row, col, where to put)
% plot out erp
% plot() needs vector
plot(GA(channel,:));

% open a figure
h = figure('Color','w','Position',[1 1 800 600]); 
subplot(1,2,1); hold;
% plot out erp
plot(GA(channel,:)); 
plot(GA(channel-1,:),'r'); % let's act like another channel is a second condition for demonstration purpposes, because we only have one
% plot our topography
subplot(1,2,2); hold;
topoplot(GA(:,700),EEG.chanlocs);

% stats
condition1 = squeeze(all_averages(channel,:,:));
condition2 = squeeze(all_averages(channel-1,:,:));
alpha = .001;
sig = ttest(condition1',condition2',alpha);

