%% Catch Up and Review

% We have covered many topics so far. June 4 we introduced several concepts
% and the basic tools you will need to query and troubleshoot.

% Next we introduced the ins and outs of basic data structures.

% Last week we combined this information to discuss flow control. Together
% this information provides the foundation for the principles needed to
% successfully understand how to code. ALOT of practice will get you to an
% end goal. 

%% Here we illustrate a complex breakdown of the concepts discussed so far

% Let us load a dataset: The one below is built into matlab and we serve as
% an example

% First make sure your workspace is clear

clear

load census1994.mat

% Two data structures appear. This dataset was designed for machine
% learning practice. For our purposes we will just probe 'adultdata'

adultdata.Properties.VariableNames % You can check this by typing and querying 
% after the dot in each example. Query by pressing tab at this point
% 'adultdata.'

% This documentation describes how to access information in tables like the
% one we uploaded: https://www.mathworks.com/help/matlab/matlab_prog/access-data-in-a-table.html

% For our purposes, lets use a loop to parse and load info

% Lets figure out how many columns we have
size(adultdata,2) % Should say 15

% Now lets use that info to work through the dataframe. NOTE: There are
% many ways of doing this. The below is an example for illustrative
% purposes to show you how these tools might work. 
count = 0;
% First lets count folks older than 35
new_vector = table2array(adultdata(:,1)).';
for p = new_vector;
    if p > 35;
        count=count+1;
    end
end
% Let us find how many subjects we have
Num_Total_Subs = height(adultdata(:,1));
Num_Subs_Above35 = count;
Percent = Num_Subs_Above35/Num_Total_Subs * 100

% Several things occur in the above
% First is our dataset was loaded as a table. Keep this in mind.
% We were interested in investigating the first column of the table (age). 
% So we grabbed all values and converted their table format to an array 
% that we called 'new_vector.' Then, we identified the subjects with an age 
% greater than 35 which we slotted into a new vector called 'New_Value.' 
% Then we found the percentage of folks that are above the age of 35 from 
% what we constrained. 

% We can get the same results with many methods.  For example:
adultdata_logical = table2array(adultdata(:,1)) > 35;
percent_above_35 = sum(adultdata_logical)/length(adultdata_logical) * 100

% Can you understand what happened above?  Try to explain each step.

% Below is another touch on functions:
clear all % This will clean MATLAB's workspace.
A = [16 -8 4;
    -8 13 4;
    4 4 9]; % A is a 3x3 matrix and A == A'.
n = size(A,1); % n is the number of rows in A, which is 3.
                % What if we wanted to know the number of columns?
L = zeros(n); % L is a 3x3 matrix with zeros for all entries.
                % What is 'zeros'?
for k=1:n % This for loop starts from k=1 and counts to k=3. Why 3?
    L(k,k) = sqrt(A(k,k)); % When k=1, we had L(1,1) as zero but is now
                           % defined to be √(16) which is 4.
    for i=k+1:n % When k=1, this for loop counts from i=(1)+1=2 to i=3
        L(i,k) = A(i,k) / L(k,k); % When k=1 and i=2, the L(2,1) entry was
                                  % zero but is replaced by (-8)/(4) which
                                  % is -2. We then go to the next for loop.
        for j=k+1:i % Similar to the latter for loop, this for loop counts
                    % from j=k+1 to i.
            A(i,j) = A(i,j) - L(i,k)*L(j,k); % When k=1 and i=2 and j=2,
                                             % the A(2,2) entry was 13 and
                                             % is replaced by
                                             % (13)-(-2)*(-2) which is 9.
                                             % We remain in this for loop
                                             % until j=i=2 loop is
                                             % complete. Since j=i we
                                             % return to the previous for
                                             % loop where i will be i=3.
        end
    end
end

% How would we make the above a function called cholsolv?

% Before you continue again, upload the data
load census1994.mat

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Practice problems:

% 1. How to check is adultdata is a table?
% 2. Find the mean capital gain for females.  
% Hint: there are many ways to do this. For more advanced solutions, read 
% https://www.mathworks.com/help/matlab/matlab_prog/calculations-on-tables.html

% 3. Graph age vs hours per week across all subjects. Hint: Use the help
% function to find out how to show only markers and not lines.

% 4. Graph the histogram of hours per week across all subjects. Then graph
% the histograms for people under 65 and at least 65 years old.  Hint: use  
% the histogram function.  Type help histogram

% 5. Graph how many people there were of each listed race.

% 6. Create a for loop that counts 0-> 10 in increments of 2. Do not do this by
% making a prior array that is already separated in 2s. HINT: use the (:)
% notation.

% 7. Create a while loop using a counter that stops at 5. 

% 8. Index the entire second column of the adultdata table as an array WITHOUT CONVERSION. 
% HINT: this link provides an explanation on the difference between certain
% indexing approaches with table data: https://www.mathworks.com/help/matlab/matlab_prog/access-data-in-a-table.html

% 9. Plot a histogram of the age distribution by indexing and making a
% histogram call. Provide an xlabel, ylabel, and title

% 10. Create a 4 X 5 matrix of ones and a 4 X 5 matrix of 2s. Then
% concatenate them into a 4 X 10 matrix. HINT: This can be done a few ways,
% we discuss some in jun4.m

% SCROLL DOWN FOR POSSIBLE SOLUTIONS













































%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Solutions:

% Question 1
istable(adultdata) % answer is logical 1

% Question 2, solution #2.

female_logical = table2array(adultdata(:,10)) == 'Female';
female_adultdata = adultdata(female_logical,:);
female_meancapitalgains1 = mean(table2array(female_adultdata(:,11)))

% Question 2, solution #2 (advanced).

capgains_summary = groupsummary(adultdata,'sex','mean','capital_gain')
female_meancapitalgains2 = capgains_summary{1,3} %notice answer is same as method 1


% Question 3
X = table2array(adultdata(:,1));
Y = table2array(adultdata(:, 13));
plot(X,Y, ...
    'LineStyle','none',...
    'Marker', 'o')
xlabel('Age')
ylabel('Number of Hours')


% Question 4
% all subjects
histogram(table2array(adultdata(:,13)))
xlabel('Number of Hours')
ylabel('Count')

% two age groups
subplot(2,1,1)
under65_logical = table2array(adultdata(:,1)) < 65;
histogram(table2array(adultdata(atleast65_logical,13)))
xlabel('Number of Hours')
ylabel('Count')

subplot(2,1,2)
atleast65_logical = table2array(adultdata(:,1)) >= 65;
histogram(table2array(adultdata(atleast65_logical,13)))
xlabel('Number of Hours')
ylabel('Count')


% Question 5
histogram(table2array(adultdata(:,9)))
xlabel('Race')
ylabel('Count')

% Question 6
count = 0
for i = 0:2:10;
    disp(['Increments of 2 so our array grows by:' num2str(i)])
    count=count+1;
end
disp(["The loop ran:" num2str(count) "times"])

% Question 7
count = 0
while 5 > count;
    disp(["Count is" count])
    count = count+1;
end

% Question 8
adultdata{:,2} % using curly brackets with a table

% Question 9
histogram(adultdata.age)
xlabel('Age Bins'), ylabel('Age Frequency'), title('Distribution of Age in Years')

% Question 10
Mat1 = ones(4,5) % create a ones matrix of 4 X 5
Mat2 = ones(4,5) % create another ones matrix
Mat2(Mat2==1)=2 % replace all instances of 1 with 2

horzcat(Mat1,Mat2) % use horzcat to combine the two matrices into a 4 X 10 
