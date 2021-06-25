%{
We have been working on several concepts now over the past month. We have
worked our way from variable assignment, data-types, data querying, matlab
layout, and functions. 

This final overview document incorporates elements from the two previous
lessons. We combine them here in order to show you how they build together.
%}


%% Flow Control
% Virtually all forms of computing occurs in linear fashion. In terms of
% coding, that translates to the interpretation of commands line by line.
% Flow control, refers to the manipulation of commands being read. So far,
% we have been doing this "manually" by running code chunks sequentially by
% highlighting and evaluating.

% Matlab background on the following topics: https://www.mathworks.com/help/matlab/matlab_prog/loop-control-statements.html

% Example:
A = [0:5] % Step 1
B = [6:11] % Step 2
C = A.*B % Step 3
% Highlighting and running the commands for A, B, and C will execute in sequence 
% from top to bottom. Which is how we have been working with code. One
% could argue this is how computers think, sequentially.

clear

% In a typical Matlab script we want to perform a bunch of
% computations/operations and to do that we need to control their flow.
% One way to do this can be to use loops and conditional statements.
% This approach can constrain computations to execute statements 
% only under certain predefined conditions.

%% REMINDERS
% If we do not know what something is we can query their properties.

% Datatypes and structure can be observed visually in the Workspace. Each
% variable item contains a description that is useful. Built-in functions
% like size, isstring, class, etc. will help you deduce how to both query
% the internet to address your questions and debug code.

% We can also use the helper functions to call on documentation:
% what is the function 'max'?

help max

doc max

% Unsure of the properties of a data structure?

cat = [1 3 2 2 3 1 1 2 3 3 2 1];

size(cat) % ROW X COLUMN = 1 X 12

class(cat) % matrix of double floats

isfloat(cat(1,2)) % check a particular value inside the cat structure to see if it 
% is a float. ANSWER IS YES, produces a logical value of 1

% What I did above was combine matrix indexing with a query function. Just
% like with the info below we can build complex data calls by nesting
% commands. The above example first calls the index value that is then
% evaluated by 'isfloat' to produce a logical True=1 or False=0. This is a
% critical way to think about code and to learn to debug on your own.

clear

%% Conditional Statements
% Sometimes we will only want certain commands to run when a
% condition is satisfied. We can use the (if) statement to do this.
% Practically speaking, this is one strategy to filter data or a sequence
% of events. Which we will illustrate below.

% We recommend Dr. Talbert's video's on conditional statements linked
% below: https://www.youtube.com/watch?v=WBkTaGKeZvE

% Create a data matrix:
data = [4 14 6 11 3 14 8 23 17 12 10 18;
        7 20 22 8 10 5 8 7 11 9 17 12;
        12 4 6 13 20 14 18 7 6 12 9 18];
cat = [1 3 2 2 3 1 1 2 3 3 2 1];

% Remember the above two structures contain information in complementary
% ways. cat is a 1 X 12 matrix and data is a 3 X 12 matrix, both of with
% contain double-point floats. 

% If the condition is satisfied, the below will occur 
if data(2,4)==8 
    a = 10; 
    v = 5;
    k = 3;
end

% The above conditional says if the index at row 2 column 4 equals 8, then
% create the variables a, v, and k. You can check this manually by doing
% the following: data(2,4), if you run that the output will say 8. This is
% illustrative and simply provides a means to describe how the conditional
% works. In a real data circumstance, it may be that this index represents
% a meaningful placement of information by subject, trial, or EEG lead time
% point (this is a crude analogy but serves the purpose). 

% What if we ask the same question using another index?

if data(3,2)==8 
    a1 = 10; 
    v1 = 5;
    k1 = 3;
end

% Nothing happens because that index does nothing. If we open the matrix
% 'data' in the workspace we see that the value 4 is at row 3 X column 2. 
% We can even verify that by evoking the call: data(3,2)

% Why does the below work using another index?
if data(2,7)==8
    a = 5;
end

% Because there is more than one 8 in the matrix which we can verify by
% opening data and observing the value at data(2,7).

% What is happening below? It is a bit more complicated but we are asking a
% more generic question using another kind of statement.
if size(data,1) > 2;
    disp(['Data can only have two rows. Your data has ' num2str(size(data,1)) ' rows'])
end

% This is a more complex statement combining numerical outputs with
% character strings! We are interested in understanding whether the size of
% rows is greater than 2. We can ask the same question about columns by
% saying size(data,2). Which in this case would still call on the display
% statement 

% It is important to understand other conditional operators. It is common
% to use multiple operators to compare several things at once. We caution
% the use of these in if statements and loops and briefly describe that
% below.

% | and & - (aka "or" and "and") work fine in this circumstance

1 & 2 < 0 % output is a logical 0 because this is not true
            % It this is equivalent to and(1,2) < 0

A = [5 7 0; 0 2 9; 5 0 0] % these two arrays will be illustrative
B = [6 6 0; 1 3 5; -1 0 0]

A | B % This is a specific comparison that produces a logical matrix output
        % The zeros represent where an absence of a value in both matrices
        % exist. This could be useful depending on your need but it works
        % differently in for loops and conditionals as we discuss below.
        % NOTE: A | B is equivalent to or(A,B)
        
% However, matlab recommends the double && and || formats
% for conditional and loop statements. That is because the double statements 
% always evaluate logical scalars. Here is some more documentation that
% refers to this: https://www.mathworks.com/help/matlab/ref/logicaloperatorsshortcircuit.html#bt_0nai-1
% The concepts are complicated but follow our recommendations for now. They
% will serve to assist you in most circumstances. 

% Here we illustrate the individual if statement using the 
% double 'or' comparison. It says, if the first part is true, then evaluate
% the second to see if that is true. 
if data(2,2)< 21 || data(2,2)> 25
    a = 8;
    k = 10;
    v = a+k;
end

% Again here in the above we are making our comparison using the value at
% index data(row,column). If either of those values are above 25 or below
% 21, the values a, k, and v will be made.

if data(2,2)< 15 && data(2,4)== 8
    a = 10;
end

% the above works the same as before except now we are asking to run the
% computation if both statements are true. We use the short-circuit double
% 'and' to do this and assign the variable 1 to the value 10. 


% In some circumstances we might want to check several options using
% a sequence of if statements. This is where the elseif statement appears.
% Below we use it in an example

% elseif and else
if data(2,4) > 10
    a = 5;
elseif data(2,4) < 10
    a = -5;
else
    a = 0;
end

% The above asks if the indexed value at data(2,4) is more than 10, if so a
% gets assigned the value 5. If not, the next section is ran to see if the
% value is below 10. If so, the balue -5 is assigned to a. If neither of
% these values meet the conditions, then a is assigned the value of 0. This
% could be the case if there is an absence of a value at this point in the
% matrix (such as NaN). Test this yourself by changing the value of the
% element in data(2,4) to see how the above if statement reacts.

%% Loops
% show decision structure picture -- See the github directory and email
% blast for the drawn image. 

% Again we recommend Dr. Talbert's videos as a nice review and suppliment
% to what we covered. Here is the basic for loop: https://www.youtube.com/watch?v=5a3bpKuBpgo

% Basic scripting and flow control. Loops are the bread and butter of
% coding. If you can master the utility of the loop, you have developed a
% decent understanding of their power and purpose (and can call yourself a
% coder wooohhhooo).

% for loop
% Do something several times, iterable

% The bottom loop takes advantage of the colon operator we learned about in
% an earlier lession. First, lets remind us what 1:10 does. Plus this into
% the command window and check the output. it provides a 1 by 10 matrix or
% vector that contains 10 elements in ascending value increments of 1. 

z = 1; % initialize the counter for which iteration the loop is on --
% we want the first iteration to show iteration number = 1
for i = 1:10
    disp(['Current value of i is: ' num2str(i)])
    disp(['Current iteration is: ' num2str(z)])
    z = z+1;
end

% The for loop always iterates through the sequence of values you provide.
% The above loop loops through each element in the vector 1:10 and assigns
% it to the value i. remember, we can call this value whatever we want and
% use it as we see fit. Our call with the function disp allows us to
% visualize what is happening.

z=1; % initialize the counter for which iteration the loop is on
for i = [2 5 10]
    disp(['Current value of i: ' num2str(i)])
    disp(['Current iteration is: ' num2str(z)])
    z = z+1;
end

% The above is a more literal example of what we discussed above. Here I am
% actually showing you the vector and each element that the loop will
% iterate through. Remember, i takes on the value of the element call, not
% the number of loops. We use num2str() in order to convert our float
% element into a string value to combine it with the string 'Current value 
% of i is:'. This is what the disp function expects. We can ask how to use 
% disp by using the: help disp, or doc disp

for i = 1:size(data,1)
    disp(i)  % you can disp a single variable value alone without num2str
    sub_mean(i) = mean(data(i,:));
end

% The above is a lot more complicated and combines several things we have
% discussed so far. '1:size(data,1)' this statement is saying 1 through the
% number of rows in the matrix data. We can break this apart by first
% checking what size(data,1) does (produces the number 3) and then to see
% what '1:size(data,1)' does. Now we see what is being iterated. Next we
% can examine what is happening inside the for loop. mean is a built-in
% function in matlab. It takes the average of its input, which we can check 
% by asking the documentation: help mean
% We see that mean takes the average of each rows values. We know this
% because we know that the iterable is built off our use of 1:number of
% rows. We then ask to average data(row iteration value i, all values in
% row). We the  assign it to a vector we create using the iterable in a
% somewhat clever way. Each value is put at the i position (which for us
% goes from 1 to 3 because of how we set up the iterable). So the sub_mean
% vector we created assigns a value there in a left to right sequential
% position only because our loop value for i is based on the value range we
% make (1 through 3) with the call '1:size(data,1)'.

% Expand on how the loop is working separately from the call inside. Check
% again you understand the iterable logic. See below. NOTE* The display
% function turns "print" and i into a 1 x 2 string array in the call when 
% you use double quotes. 

for i = 1:10
    disp(['print with single quotes only: ' i ]) % doesn't work correctly
    disp(['print with single quotes and num2str: ' num2str(i)]) % displays a single character vector
    disp(["print with double quotes only: " i]) % displays a string array
end


% Conditions within conditions to read code and perform  computations:
for i = 1:size(data,1)
    disp(['Here is i value:' num2str(i)])
    if mean(data(i,:))< 11.5
        disp(['Broken because average is below 11.5'])
        break;      % stops the for loop
    else
        disp(['Not broken because average is above 11.5'])
        test(i) = mean(data(i,:));
    end
end

% The above builds on the two ideas we discussed. The spacing helps matlab
% to understand the nested structure where the outer for loop is run first
% before running the if statement code chunk inside. We insert the call
% 'break' to stop the if statement inside the loop if that condition is
% satisfied. 

a = 1;
for sub = 1:3
    for i = 1:3
        cat_cells = cat==i;
        temp_data = data(sub,cat_cells);
        cat_mean(sub,i) = mean(temp_data);
    end
end

% This is a fancier version of what we have already discussed. Again we are
% nesting value calls where the first for loop is run before the second. We
% create a variable called cat_cells to use as an index in a later call. I
% encourage all of you to break these down to understand what each section
% is doing using the disp function.

% Another primary type of loop is the while loop. We recommend reviewing
% Dr. Talbert's video on the topic linked here:https://www.youtube.com/watch?v=O6vD-E3AZoo

% while loop
% Do something until (when you want to loop, but don't know how many times)

% Explain how to use disp with character strings and numeric variables

x = 0;
j = 0; % specify where to start j
counter = 2; % in this example, specify how much you want to add to j on 
% each iteration
while x==0
    disp(j)
    disp(['Counter continues in increments of:' num2str(counter)])
 
    if j > 20
        disp(['Until we exceed 20 and j is:' num2str(j)])
        x = 1;
    end
    
    j = j+counter; %update j for next iteration
    disp(['Time for next iteration']) %notice that this still displays when 
    % j = 22 because the loop hasnt started over yet to check if x==0.  
    % Once it does, it sees x is not zero (x=1), and the whole thing stops.
    
end


clear


% Comprehension check: Another way to handle write the while loop is to use
% a break.  How would you rewrite the above using a break?


%% Functions
% defines some function called average1.m that accepts an input vector,
   % calculates the average of the values, and returns the result
   
% The below will not work without the additional files we include in github
% and that when they are called below the .m files exist inside the same
% folder. Here is an explanation by Matlab that covers it; we've adapted 
% what they have for the examples below (for original, see
% https://www.mathworks.com/help/matlab/ref/function.html)

% Also, we recommend Dr. Talbert's video explaining a bit of what we detail below:
% https://www.youtube.com/watch?v=qo3AtBoyBdM

%{

% Example of a function we wrote inside the average1.m file
function ave = average1(x)
    ave = sum(x(:))/numel(x); 
end
%}

% Below we call it after assigning x to a vector that we know our 
% function can use.
x = [2 3 4 5];
average1(x)

% call function from the command line
z = 1:99;
mean = average1(z)

%% Functions and Conditionals
% Did you make an external script? Things to ask yourself if you plan on
% calling a function you made in another script alongside your current
% script. The utility of doing this is that you may find yourself repeating
% the same code call in everyone one of your scripts. Creating a function
% saves space and automates the process. Additionally, it creates a 'go-to'
% when you share your scripts with collaborators.

% Loop example:
nrows = 4;
ncols = 6;

% Issue?
function mat = Make_Mat(nrows,ncols)
    mat = ones(nrows,ncols);
    for c = 1:ncols
        for r = 1:nrows
            if r == c
                mat(r,c) = 2;
            elseif abs(r-c) == 1
                mat(r,c) = -1;
            else
                mat(r,c) = 0;
            end

        end
    end
end

% The issue above is that we are attempting to call the function inside our
% script. We need to call it from the Mke_Mat.m file we created externally
% to house our function... per Matlab's design.

% File Make_Mat.m
Make_Mat(4,6)

% The above works!
   
%% Plotting

% Plotting is a VERY complicated topic. This is a critical point that the
% "help" function will support and solve. 

% linear plot
x = [0:5:100];
y = x;
plot(x, y)
% What does: help plot 
% say?

%{
The output when I call: help plot
    plot(X,Y) plots vector Y versus vector X. If X or Y is a matrix,
    then the vector is plotted versus the rows or columns of the matrix,
    whichever line up.  If X is a scalar and Y is a vector, disconnected
    line objects are created and plotted as discrete points vertically at
    X.
%}

% squared matrix [note the (.)]
x = [-100:20:100];
y = x.^2;
plot(x, y)

% The description above applies here as well, the only difference here is we changed
% the scaling of x and y.

% Placement of function calls for plotting...does this matter?
% Not necessarily here, Yopu would want to transform your datapoints before
% calling the plot support functions like 'xlabel' and 'title'
% one wavy boi (sinusoidal)
x = [0:0.01:10];
y = sin(x);
plot(x, y), xlabel('x'), ylabel('Sin(x)'), title('Sin(x) Graph'),
grid on, axis equal

% We can use help plot here to ask about the extras posted above like the
% below examples:
% help xlabel
% help grid

% two wavy bois
x = [0 : 0.01: 10];
y = sin(x);
g = cos(x);
plot(x, y, x, g, '.-'), legend('Sin(x)', 'Cos(x)')
% In the above x is being used twice for the first x,y and second x,g plot

% polynomials
x = [-10 : 0.01: 10];
y = 3*x.^4 + 2 * x.^3 + 7 * x.^2 + 2 * x + 9;
g = 5 * x.^3 + 9 * x + 2;
plot(x, y, 'r', x, g, 'k')
% Expand on how the color marker works as exemplified above. the 'r'
% corresponds to the 'red' below, k to black and so forth. Test this
% yourself by changing those character strings using other colors.

% plotting color code % w=white; k=black; b=blue; r=red; c=cyan; g=green;
   % m=magenta; y=yellow
   
% setting axis scales
axis ( [xmin xmax ymin ymax] )
% we can check this axis call: help axis

% generating sub-plots
% subplot(m, n, p) % we do not have a plot m, n, or p but this is the idea
% Check here by saying help subplot
% This is a lot more complicated and deals with putting multiple plots into
% one window.

% Use of subplots examples; make sure to evaluate both subplots at the same
% time to see them together!
subplot(2,1,1);
x = linspace(0,10);
y1 = sin(x);
plot(x,y1)

subplot(2,1,2); 
y2 = sin(5*x);
plot(x,y2)

% For review, see matlab documentation here on subplots: 
% https://www.mathworks.com/help/matlab/ref/subplot.html

%% EXTRA - CONDITIONAL
% Unique to Matlab is the "Switch" statement. The below is an example of a
% switch statement. I want to emphasize this is peripheral and will not
% necessarily be a critical factor to your success with our tutorial
% series.

%{
Testing for equality against a set of known values with a switch statement.

[dayNum, dayString] = weekday(date, 'long', 'en_US');

switch dayString
   case 'Monday'
      disp('Start of the work week')
   case 'Tuesday'
      disp('Day 2')
   case 'Wednesday'
      disp('Day 3')
   case 'Thursday'
      disp('Day 4')
   case 'Friday'
      disp('Last day of the work week')
   otherwise
      disp('Weekend!')
end
%}