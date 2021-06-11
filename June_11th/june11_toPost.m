%% Vectors (review):
% vectors are a row or column of numbers 
% so, a matrix can be parsed into multiple vectors
% every vector is an array
% element - a single number within a matrix
% cell - a single value within a cell array 
vector1 = [6 6 2 4 8 6];
vector2 = [6, 6, 2, 4, 8, 6];   % row vector
vector3 = [6; 6; 2; 4; 8; 6];   % column vector

% change row to column vector
transposed2 = vector2';
% change column to row vector
transposed3 = vector3';

%% Create a data matrix:
% matlab counting starting at 1, unlike Python which is 0
% matrix operations follow the rules of linear algebra
% size: rows X columns
% a matrix is an array with 2 dimensions, so all matrices are arrays
% square brackets create a matrix []
% commas separate rows
% semicolons separate columns

a = [1, 3, 2, 2, 3, 1, 1, 2, 3, 3, 2, 1]; 
b = [4 14 6 11 3 14 8 23 17 12 10 18;
        7 20 22 8 10 5 8 7 11 9 17 12;
        12 4 6 13 20 14 18 7 6 12 9 18];

%% Accessing values in vectors:
% to access elements in a vector, use round brackets ()
% find the second value in a:
a(2)

%% Accessing values in matrices:
% find row 1, column 10 in b:
b(1,10)
% find row 4, column 2 in b:
b(4,2)
% Why does the above error?

%% Accessing values in cell arrays:
% Remember: the difference between cell arrays and matricies is what is
% stored in them!
% a matrix is a type of array that stores numerical data
% an array contains other types of data too like strings or other arrays
% important to note as EEG data is stored as arrays inside arrays
c = {'apple' 'orange' 'lemon'; 'bagel' 7 'muffin'}
% get row 2, column 3 -> 'muffin'
c(2,3)

%% Changing a single element of a matrix
d = [5 8 3; 2 1 8];   % create a 2x3 matrix
% change the 2 to a 4
% What row and column is the 2 in?

d() = 4   % d(row, column)

%% Changing multiple elements of a matrix at once
h = [4 8 3; 6 4 2; 9 7 2; 6 2 1]

% in h, get row 1 and elements in the 1st and 3rd columns
h(1,[1 3]) 
% change the 1st and 3rd elements of row 1 to the value of 2
h(1,[1 3]) = 2;
% What are some ways we can be sure this worked?

%% Concatenating a vector to a matrix
% aka - 'adding' (not mathematical addition) a row or a column to a matrix
% refer to a new row or column and it will be created
% the row or column MUST match the size of the original matrix
% add a third row to d containing 8 3 5
h(5,:) = [8 3 5]

%% Colons, : <- that kind
% when used within round brackets like above, a colon means 
   % 'everything in a row or a column'
% often used as a way of getting data from a matrix
% as you can imagine in EEG, getting data from a time point could be useful
% create e, which contains column 3 of d
d = [5 8 3; 2 1 8]; 
e = d(:,3); 
% What is another name for e besides 'part of a matrix'?

% get every element in row 2 of d
d(2,:)
% turn entire matrix d to column vector f
f = d(:)
d = [5 8 3; 2 1 8]; 
% find the first two values in the first row
d(1,1:2)

%% Extracting data from matrix using colon
% recall that last week, colons counted by integers between two numbers
g = [1:8];
% get all values in columns 3, 4, and 5 of b
b = [4 14 6 11 3 14 8 23 17 12 10 18;
        7 20 22 8 10 5 8 7 11 9 17 12;
        12 4 6 13 20 14 18 7 6 12 9 18];
b(:,3:5)

%% Using colons for step counting
% create some vector j that counts from 5 to 27 in steps of 3
j = [5:3:27]

%% Basic functions
% function - group of statments that together perform a task
   % can accept multiple input and output arguments

% Here is a function applied to a scalar
c = sin(4)      % In rad (1 rad = 57.2 degrees)

% Here are functions applied to vectors
a = [1, 3, 2, 2, 3, 1, 1, 2, 3, 3, 2, 1];
c = sin(a)

c = max(a)

% Length of a vector
c = length(a)

%% Create a vector/matrix with a function:

d = zeros(4,4);
e = ones(4,4);
f = rand(4,4);

%% Basic math
z = 5
y = 7

z + y
z - y
z * y
z / y
z^y

%% Basic math with vectors and matrices:
% matrix operations: follow the rules of linear algebra
% array operations: execute element by element operations AND support
   % multidimensional arrays
% (.) period character distinguishes array from matrix operations
% rules are same for addition and subtraction so you don't neet to specify

% You can add and subtract vectors of the same size:
v1 = [1:3];
v2 = [5:7];
v3 = v1+v2

% Same for matrices:
m1 = [5 7 8; 0 1 9; 4 3 6];
m2 = [1 2 3; 1 2 3; 1 2 3];
m3 = m1-m2

%% Multiplying and dividing matrices
% array operations execute element by element operations and support
     % multidimensional arrays
% (.) distinguishes array operations from matrix operations which only
     % matters for .* and ./
% .* is element-wise multiplication (dot product)
% * is matrix multiplication
% an example of when data type REALLY matters

% You can multiply and divide corresponding values:
v4 = v1.*v2
m4 = m1./m2
m5 = m3*8

% You can compute power:
m6 = m1.^2

%% Matrix manipulation review
% Create a 4-by-1 matrix array starting from 1 to 4 
% and assign it to a variable called A.

% Create a 4-by-1 matrix array starting from 1 to 8 by increments of 2 
% and assign it to a variable called B.

%  What is the dot product of A and B? 

% What about B and A?

% Create any 3-by-4 matrix without defining all entries 
% (i.e., do not write [1 2 3 4; 5 6 7 8; 9 10 11 12]). 
% Call the matrix C.

% What is the entry in row 2 column 3 of your matrix C?

% Take the square root of only the entires in the third row 
% and replace matrix c with this new matrix.

% Create a 4-by-3 matrix this time calling it matrix D.

% What is the product of C and D? (meaning, use matrix
% multiplication and not dot product)

% What is the product of C and A? 

%% Colon notation review
% Create a unit-spaced vector of numbers between 1 and 10

% create vector whose elements increment by 0.1 from 0 to 1

% create vector whose elements increment by -2 between 10 and 0

% what happens if you try from 0 to 10 instead, in increments of -2?

%% Preview for next time: 
% complex data structures can exist with multiple levels
% so, an array can contain an array
