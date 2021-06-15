%% Vectors (review):
% vectors are a row or column of numbers 
% so, a matrix can be parsed into multiple vectors
% every vector is an array
% element - can be thought of as a single number within a matrix
% cell - a single value within a cell array 
vector1 = [6 6 2 4 8 6];
vector2 = [6, 6, 2, 4, 8, 6];   % row vector
vector3 = [6; 6; 2; 4; 8; 6];   % column vector

% This is the bread and butter of working with data in matlab. Take the
% time to run this code and examine these variables in the workspace, click
% on them and build a visual behin what you are making.

% change row to column vector
transposed2 = vector2';
% change column to row vector
transposed3 = vector3';

%% Create a data matrix:
% matlab counting starts at 1, unlike Python which is 0 
% -This is critical! Make sure you understand how indexing occurrs.-

% matrix operations follow the rules of linear algebra
% size: rows X columns
%%% You can check the size of a variable in matlab using:

transposed2
size(transposed2) % creates an output reffering to the dimensions of the variable

% a matrix is an array with 2 dimensions, so all matrices are arrays
% square brackets create a matrix []
% commas (or just spaces) separate rows
% semicolons separate columns

a = [1, 3, 2, 2, 3, 1, 1, 2, 3, 3, 2, 1]; % row vector
b = [4 14 6 11 3 14 8 23 17 12 10 18;
        7 20 22 8 10 5 8 7 11 9 17 12;
        12 4 6 13 20 14 18 7 6 12 9 18]; % matrix

%% Accessing values in vectors:
% to access (index) elements in a vector, use round brackets ()
% find the second value in a:
a(2) % this calls on the second element of a row vector as written

%% Accessing values in matrices:
% find row 1, column 10 in b:
b(1,10)
% find row 4, column 2 in b:
b(4,2)
% Why does the above error?
    %%%% Because there is no fourth row; you canot index a value that does
    %%%% not exist
%% Accessing values in cell arrays:
% Remember: the difference between cell arrays and matricies is what is
% stored within them!
% a matrix is a type of array that stores numerical data
% an array contains other types of data too like strings or other arrays
% --- So meta... an array of arrays woooooo
% *****important to note as EEG data is stored as arrays inside arrays
c = {'apple' 'orange' 'lemon'; 'bagel' 7 'muffin'}
% get row 2, column 3 -> 'muffin'
c(2,3)

%% Changing a single element of a matrix
d = [5 8 3; 2 1 8];   % create a 2x3 matrix
% change the 2 to a 4
% What row and column is the 2 in?

d() = 4   % d(row, column)
% d(2,1) = 4 % replace extant value with 4, row 2 and column 1

%% Changing multiple elements of a matrix at once
h = [4 8 3; 6 4 2; 9 7 2; 6 2 1] % a 4 x 3 matrix, h

% in h, get row 1 and the elements in the 1st and 3rd columns
h(1,[1 3]) 
% change the 1st and 3rd elements of row 1 to the value of 2
h(1,[1 3]) = 2;
% What are some ways we can be sure this worked?

% one way we could ask this is by using an equality (easiest)
% h(1,[1 3]) == 2
% h(1,1) == 2   % Or one at a time
% h(1,3) == 2
% each of the above sections should have provided you with a: logical 1

% can also use the find() function!
% find(h==2); % this will find all the positions in order where 2 is to
% check

% h    % or by calling h and manually checking (not advised)

%% Concatenating a vector to a matrix
% aka - 'adding' (not mathematical addition) or 'combining/appending' a row or a column to a matrix
% refer to a new row or column and it will be created
% the row or column MUST match the size of the original matrix
% add a 5th row to h containing 8 3 5
h(5,:) = [8 3 5]

a1 = [1 3 5; 2 4 6; 7 8 10]

A1horiz = [a1,a1] % horizontal concatenation, each array must have same number of rows

A1vert = [a1;a1] % vertical concatenation, each array has same number of columns

%% Colons, : <- that kind
% when used alone within round brackets like in h(5,:), a colon means 
   % 'everything in a column' (or row if h(:;5)
% often used as a way of getting data from a matrix, but can be used to
% make intervals.
% as you can imagine in EEG, getting data from a specific time point could be useful
% create e, which contains column 3 of d
d = [5 8 3; 2 1 8]
e = d(:,3)
% What is another name for e besides 'part of matrix d'?
      % a column vector

% get every element in row 2 of d
d(2,:)
% find the first two values in the first row of d
d(1,1:2)
% turn entire matrix d to column vector f
f = d(:)

%% Extracting data from a matrix using colons
% recall that last week, colons counted by integers between two numbers
g = [1:8];
% get all values in columns 3, 4, and 5 of b
b = [4 14 6 11 3 14 8 23 17 12 10 18;
        7 20 22 8 10 5 8 7 11 9 17 12;
        12 4 6 13 20 14 18 7 6 12 9 18];
b(:,3:5) % so the colon grabs everything between the minima and maxima

%% Using colons for step counting
% create some vector j that counts from 5 to 27 in steps of 3
j = [5:3:27]
% Why is the last number 26, not 27 when evaluated?
   % because although 27 is divisible by 3, it is not when you start
   % counting at 5; counting by integers, you cannot reach 27 counting by
   % 3s from 5

%% Basic functions
% function - group of statments that together perform a task
   % can accept multiple input and output arguments

% Here is a function applied to a number (double)
c = sin(4)      % In rad (1 rad = 57.2 degrees)

% Here are functions applied to vectors
a = [1, 3, 2, 2, 3, 1, 1, 2, 3, 3, 2, 1];
c = sin(a)

c = max(a)

% Length of a vector, useful for loops which will be covered next week
c = length(a)

%% Create a vector/matrix using a function:

d = zeros(4,4); % 4x4 matrix zeros
e = ones(4,4); % 4x4 matrix of ones
f = rand(4,4); % 4x4 matrix of random decimals between 0 and 1

%% Basic math
z = 5 % variable z equals 5
y = 7 % variable y equals 7

z + y % add
z - y % subtract
z * y % multiply
z / y % division
z^y % squared

%% Basic math with vectors and matrices:
% matrix operations: follow the rules of linear algebra
% array operations: execute element by element operations AND support
   % multidimensional arrays (execute using '.')
% (.) period character distinguishes array from matrix operations
% rules are same for addition and subtraction so you don't need to specify

% You can add and subtract vectors of the same size:
v1 = [1:3]; % create a vector
v2 = [5:7]; % create another vector
v3 = v1+v2 % basic vector addition

v5=v1+1 % you can also add a singular value to every cell
            % ***for an explanation of how this works with multiplication and
                 % division -- next section

% Same for matrices:
m1 = [5 7 8; 0 1 9; 4 3 6];
m2 = [1 2 3; 1 2 3; 1 2 3];
m3 = m1-m2

%% Multiplying and dividing matrices
% array operations execute element by element operations and support
     % multidimensional arrays
% (.) distinguishes array operations from matrix operations which only
     % matters for .* and ./ %**** Note 
% .* is element-wise multiplication (dot product)
% * is matrix multiplication
% an example of when data type REALLY matters

% You can multiply and divide corresponding values:
v4 = v1.*v2 % dot producct
m4 = m1./m2 % element-wise division
m5 = m3*8 % matrix multiplication

% You can compute power:
m6 = m1^2 % squared

%% Matrix manipulation review
% Create a 4-by-1 matrix array starting from 1 to 4 
% and assign it to a variable called A.

A = [1:4] % row vector that is a 4 by 1 matrix -- check using size()

% Create a 4-by-1 matrix array starting from 1 to 8 by increments of 2 
% and assign it to a variable called B.

B = [1:2:8] % row vector that is a 4 by 1 matrix -- check using size()

%  What is the dot product of A and B? 

AB_prod = A.*B

% What about B and A?

BA_prod = B.*A

% Create any 3-by-4 matrix without defining all entries 
% (i.e., do not write [1 2 3 4; 5 6 7 8; 9 10 11 12]). 
% Call the matrix C.

C = [1:4;5:8;9:12]

% What is the entry in row 2 column 3 of your matrix C?

C(2,3) % you should get 7

% Take the square root of only the entires in the third row 
% and replace matrix C with this new matrix.

C(3,:) = sqrt(C(3,:))

% Create a 4-by-3 matrix this time calling it matrix D.

D = [1:3;4:6;7:9;10:12] % you can check this with size()

% What is the product of C and D? (meaning, use matrix
% multiplication and not dot product)

C*D

%Answer
%{
ans =

    70    80    90
   158   184   210
   246   288   330
%}

% What is the product of C and A'? 

C*A'

%Answer
%{
ans =

    30
    70
    33.1308
%}

%% Colon notation review
% Create a unit-spaced vector of numbers between 1 and 10
Vector = [1:10] 

% create vector whose elements increment by 0.1 from 0 to 1
Dec_Vec = [0:0.1:1] % middle denotes increments

% create vector whose elements increment by -2 between 10 and 0
Neg_Vec = [10:-2:0] % middle denotes increments

% what happens if you try from 0 to 10 instead, in increments of -2?
Test = [0:-2:10] % it runs but makes an empty row vector

%%
% Here are some links for more info about matrix math 
    % and the conceptual foundation for functions. These are important
        % concepts, take note.

%MATRIX v ARRAY Operations: https://www.mathworks.com/help/matlab/matlab_prog/array-vs-matrix-operations.html
% Matlab Functions: https://www.mathworks.com/help/matlab/ref/function.html

%% Preview for next time: 
% complex data structures can exist with multiple levels
% so, an array can contain an array

% can you think of how to nest arrays? 
    % read the below for more info
% https://www.mathworks.com/help/matlab/math/multidimensional-arrays.html