%% Meet the GUI
%
% There is still no code here. These are a bunch of COMMENTS.
%
% The idea here is to remind me about all the things in the GUI that I want
% to show you. :)

%% Command window - this is a quick way to check things... but it is not recorded
% - Entering commands
%     type: x=5
%     type: x+1
%     clc

%% Editor window
% Files with Matlab code (scripts) have a  .m  ending
%
% This file is called 'june4.m'
% It's always best that your file names do not have spaces
% This is good june_4.m or jun4.m but not 'JUNE 4 is cool.m'
% - Opening multiple files in the editor
% - Line numbers on the left

%% Current Folder
% This is the folder where matlab will search for and save files by default
% Ideally, this is directly in your C drive (for windows) or user folder

% -- change the below code to match your computers set-up

cd('C:\hackyHour'); % change directories
cd('C:\hackyHour\june4th');
dir % list folder contents


%% Workspace
% -- Variable editor

a = 5

% -- clear all

%% Matlab basics
% The idea is to lay out the basic building blocks and name them
% if you are a major user of hot keys,
% You can make them visible by right clicking and highlighting the code of
    % interest

%% Variables
%   The basic entity of computation in all programing languages is the
%   variable. A variable can take on different values and can be
%   manipulated in different ways.

% Fundamentally, in matlab a numerical variable is a 1x1 matrix. Keep this in mind

%% A variable can be a number:

% This is a number
a = 5

% Here is another
b = 6

% Here is their sum
a+b

% Here is their product
a*b

% More math, but set as a variable
c = ((a*b)^a / (a*b))

% What is the equation above doing? Can you infer the PEMDAS of Matlab?

% Look at the variables you've created so far in the workspace window

%% Data types -- this is not exhaustive

% double - default numeric data type
% logical - values of 1 or 0 (T and F respectively)
% char - character data (strings are stored as a vector of characters)
% cell array - array of indexed cells, each capable of storing an array of
             % a different dimension and data type
             
%% Querying data types
% What is a class in matlab?
className = class(a);

% string to double 
str2double()
% double to string
double2str()
% matrix to string
mat2str()

%% The semi-colon  ;

% When you want to perform a computation without displaying the result

%% Over-writing variables:

a = 20

c = a

%% Clearing your variables:
% 2 ways: workspace and via code
clear a
clear all
% recall,   clc   clears the contents of the command window

%% Creating vectors

% This is a row vector, we build vectors with square brackets []
a = [4 5 6]

% This is a column vector
b = [1; 2; 3]

% change a row to a column using the transpose operator
c = a'

%% Getting help regarding a function
% what is the function 'max'?
help max

doc max

% What do you think a function is?

%% Describe the below variable assignments.

A = [1 0 0; 0 1 0; 0 0 1];
B = [1 2 3 4; 5 6 7 8; 9 10 11 12];
C = [2 2];
D = C';

%% Which of the above variables is a column vector?

%% Use the operator : to rewrite the assignment of B in a more compact way.

%% Describe the output of the following code. Why is the result false?

A*(D*C)*B == (A*D)*(C*B)

%% What is the difference between (=) and (==)?

%% What happens when trying to assign 9 to the below variable?

3sq = 9

%% Clear the command window without clearing the workspace.

%% Create a variable called x with a value of pi/2.

%% Use the cos function to calculate the cosine of x. Assign the result to a variable called y.

%% What happens when you multiply a string variable by a numeric?

p = 'string1'*1

% what if we wanted to compare the equivelance of two strings?

strcmp('hi','hie')

% what is strcmp?  Can you find it's docs? 

%% What happens when you multiply two string variables?
p = 'string1'*'string2'
%% How do you check what data type a given variable is?
p = 'string'
%% Is there a difference between integers and floats? 
    % Can they be multiplied together?

x = 25.783;

x1 = 5;

class(x)
class(x1)

isfloat(x)
isfloat(x1)

% How about
x2 = single(x1)
isfloat(x2)
class(x2)
class(x1)

% what if I multiple them, what is the output? Single or Double?
at = x*x2
%% ####################### Introduce symbolic numbers variables and expressions?