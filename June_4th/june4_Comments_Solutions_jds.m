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

% **** Note, in a spreadsheet, to my knowledge a literall cell box is called
% an element. We use this word alot as does the documentation so keep it in
% mind.

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

pwd % checks what your working directory is

%% Workspace
% -- Variable editor

a = 5

%{
Remember what we covered today −

Once a variable is entered into the system, you can refer to it later.

Variables must have values before they are used.

When an expression returns a result that is not assigned to any variable, 
the system assigns it to a variable named ans, which can be used later.

It will always overwrite unspecified output as "ans"
%}
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

% This is a number that we assigned
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

% Yes, the above are all variables containing single values so they do
% follow the right math logic here. This becomes more complicated with
% multi element arrays of increasing size

%% Multiple Assignments
a = 2; b = 7; c = a * b %This syntax arrangement also works. Remember, if you run this
% it will overwrite whatever a,b,c were assigned before. 

% Look at the variables you've created so far in the workspace window
% one way we can do this is through the "who" command
% who will tell you basically what the names are of the variables in the
% workspace

% "whos" goes into detail about what those variables are. Be minful of
% using this as it really clutters the command window when lots of
% variables exist.

%% Query data type and value

% isinteger() - is integer array?

% isfloat() - is floating point array?

% isreal() - is numeric array? -not string

% isinf() - does array use complex storage? This gets at matlabs interleaved
% storage system

% isnan() - which array elements are nan or "not a number" -- zero is a
% number in this case

% isstring() - is this variable a "string" we make in double quotes " "

% ischar() - is this a 'character string' we make in single quotes ' '

%% Schematic of data types

% In the folder on github I have provided an image that illustrates data
% types
I_am_image = imread('<UPLOAD_PATH_TOO_SEE_THIS_AND_PLACE_HERE>/Cool_Figure.png') % This will load the image
imshow(I_am_image) %this will load the image
%% Data/Numeric variables -- this is not exhaustive, just what we need for ERP analyses

% double - default numeric data type, stored with higher precision 
% logical - values of 1 or 0 (T and F respectively)
% char - character data (strings are stored as a vector of characters)
% cell array - array of indexed cells, each capable of storing an array of
             % a different dimension and data type
             
%% Querying data numeric types
% What is a class in matlab?
className = class(a);

i = '100'

% character string to number (char)
str2num(i)
isfloat(ans) % logical yes
% number to character string (char)
num2str(i)
isfloat(i) % logical no
% matrix to character string (char)
mat2str(i)
ischar(i) % logical yes
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

% How does the work space look? When you click on a, b, and c what opens?
% we see their element-wise representation

%% Getting help regarding a function
% what is the function 'max'?
help max

doc max

% What do you think a function is?
% for our purposes they are built in tools... but we can make them ourself!

%% Describe the below variable assignments.

A = [1 0 0; 0 1 0; 0 0 1]; % creates a 3x3 matrix
B = [1 2 3 4; 5 6 7 8; 9 10 11 12]; % create a 3x4 matrix 
C = [2 2]; % a row vector
D = C'; %transpose c

%% Which of the above variables is a column vector?
% None, all we have are matrices that can be broken down into their
% components

%% Use the operator : to rewrite the assignment of B in a more compact way.
% B = [1:4; 5:8; 9:12];
% the colon : here can be used to say all things between 1 and 4 etc..

%% Describe the output of the following code. Why is the result false?

A*(D*C)*B == (A*D)*(C*B)

%In this case this, is an issue to do with matrix
% Order of operations matters here, but A B C D are not single values but a
% mtrix of values.

%% What is the difference between (=) and (==)?

% = can assign values and == is element wise equivelance

%% What happens when trying to assign 9 to the below variable?

3sq = 9 %the output give recommendations and the numeric is not advised to be used first

% numbers at the start of variable names is bad practice

%% Clear the command window without clearing the workspace.

% can be done multiple ways: example clc

%% Create a variable called x with a value of pi/2.

x = pi/2 % why did this work? pi is a special case in matlab that has a mathematical representation. As well,
            % we have written a clear equation that does not violate any
            % rule

%% Use the cos function to calculate the cosine of x. Assign the result to a variable called y.

y = cos(x) % cos is a function that takes the cosign of whatever it is provided

%% What happens when you multiply a string variable by a numeric?
p = 'string1'

p1 = 'string1'*1 % You can have unintended consequences when you do not 
                    % carefully write out your variables
%-----------
% what if we wanted to compare the equivelance of two "strings" or "characters"?

strcmp('hi','hie')

% what is strcmp?  Can you find it's docs? 

doc strcmp

% it helps us compare the equivelance between two strings. This is similar
% to the ==

% yes, we can do "help" strcmp

%% What happens when you multiply two string variables?
p = 'string1'*'string2'
% this error is related to their underlying representation.  Be mindful of
% this in more complex algorithms.
%% How do you check what data type a given variable is?
p = 'string'

% we can do is isstring(p) for string arrays *which this is not
% we can use ischar(p) for character strings *which this is
%% Is there a difference between integers and floats? 
    % Can they be multiplied together? - the answer is no
    
% Marco - My goal in writing this was to introduce the fact that values are
% represented mathematically in different ways. This can and will matter
% depending on what you are working with and knowing that numbers can be
% viewed in broad ways for computation is important. For our purposes,
% this will likely not present as a huge thing but be mindful of this!

x = 25.783; % default in matlab is "floating point double precision"

isfloat(x) % output should be logical 1
x1 = int16(5);

isfloat(x1) % Output should be logical 0

class(x) % should say double
class(x1) % should say int16 

% How about
x2 = single(x1) % here we convert to a less precise "float single"
isfloat(x2) % But as our output shows, we are still working with float
class(x2) % but now float is single and less precise
class(x1) % And our value x1 is still an int16 

% check out these  explanations from the documentation

% what if I multiple them, what is the output? Single, Double, Error?
at = x1*x2  % you will get an error because thay are not of the same class
%% ####################### Introduce symbolic numbers variables and expressions?

% this is more complex and deals with how certain character or strings can be represented. 
% Similar to the unicode explanation.

% this could be useful to look over if you are interested in working with
% more 'string' values.... just as a way to point you in the right
% direction

% https://www.mathworks.com/help/symbolic/create-symbolic-numbers-variables-and-expressions.html

%% Here is some more information over syntax
%{
Operator	Purpose
+       Plus; addition operator.
-       Minus; subtraction operator.
*       Scalar and matrix multiplication operator.
.*      Array matrix multiplication operator.
^       Scalar and matrix exponentiation operator.
.^      Array exponentiation operator.
\       Left-division operator.
/       Right-division operator.
.\      Array left-division operator.
./      Array right-division operator.
:       Colon; generates regularly spaced elements and represents an entire row or column.
( )     Parentheses; encloses function arguments and array indices; overrides precedence.
[ ]     Brackets; enclosures array elements.
.       Decimal point.
…       Ellipsis; line-continuation operator
,       Comma; separates statements and elements in a row
;       Semicolon; separates columns and suppresses display.
%       Percent sign; designates a comment and specifies formatting.
_       Quote sign and transpose operator.
._      Nonconjugated transpose operator.
=       Assignment operator.

%}

%% Here are some special variables and constants we also highlighted today

%{
Name	Meaning

ans     Most recent answer.
eps     Accuracy of floating-point precision.
i,j     The imaginary unit √-1.
Inf     Infinity.
NaN     Undefined numerical result (not a number).
pi      The number π
%}

%% We discussed how to save and load with the GUI but here are two more ways 

save <my_file_replace_name_here> % save this way in script

load <my_file_replace_name_here> %load this way in script