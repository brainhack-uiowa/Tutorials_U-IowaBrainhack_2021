%% Creating vectors

% This is a row vector, we build vectors with square brackets []
% This is useful to organize your data
a = [4 5 6]

% This is a column vector
b = [1; 2; 3]

% change a row to a column using the transpose operator
% transposed matrix is simply a colomn-row "flip"
c = a'

% Question: how did a change?


%% Create a data matrix:
% matrix operations follow the rules of linear algebra
% Scary, but we can handle it!

% a matrix is an array with 2-dimensions, so all matrices are arrays

data = [4 14 6 11 3 14 8 23 17 12 10 18;
        7 20 22 8 10 5 8 7 11 9 17 12;
        12 4 6 13 20 14 18 7 6 12 9 18];
cat = [1 3 2 2 3 1 1 2 3 3 2 1];

% What is the difference between a the matrix cat, and the vector a?
    
%% Arrays
% array operations execute element by element operations and support
     % multidimensional arrays  
% ------------ 
% (.) distinguishes array operations from matrix operations which only
     % matters for .* and ./
     % ------- the (.) operations are UNIQUE to Matlab
% NOTE: an array is a data structure whereas a matrix is a mathematical concept

%% Basic functions

% Functions are pre-defined chunks of code that, when cleverly written,
% execute lines of code to achieve some outcome.

% Here is a built-in function applied to a scalar
c = sin(4)      % In rad (1 rad = 57.2 degrees)

% Here are other built-in functions applied to vectors
c = sin(a)

c = max(a)

% Length of a vector
c = length(a)

% Some functions are built in to matlab and other coding languages like
% python. Other functions can be reated by you, or downloaded as part of an
% add on software package to better fit your needs.

%% INDEXING: Accessing values in vectors

% find the scond value in b:
b(2)

% What if we wanted to find the tenth value? *trick question

%% Now create a two dimensional matrix:

% Three rows and three columns:
a = [5 7 8; 0 1 9; 4 3 6];

% find the value in the second row, third column:
a(2,3)

% find the two values in the first row, second and third columns:
a(1,1:3)

% the (:) can be used to index a range of array values along some dimension

% find the three values corresponding to all rows in the first column:
a(:,1)

% Can you find the third column, last value?

%% Change a particular value in the matrix:

a(2,3) = 3;

a(1,[1 3]) = [2 9]

a(1,[1 3]) = 2


%% Create a vector/matrix with a function:

d = zeros(4,4);
e = ones(4,4);
f = rand(4,4);

% What did these built in functions do?

%% Basic math with vectors and matrices:

% You can add and subtract vectors of the same size:
v1 = [1:3];
v2 = [5:7];
v3 = v1+v2

% What is the output of v3?

% Same for matrices:
m1 = [5 7 8; 0 1 9; 4 3 6];
m2 = [1 2 3; 1 2 3; 1 2 3];
m3 = m1-m2

% You can multiply and divide corresponding values:
v4 = v1.*v2
m4 = m1./m2
m4*8
% You can compute power:
m5 = m1.^2

%%% Matlab is ideally designed to perform operations on whole matrices

%% Colon notation
% Create a unit-spaced vector of numbers between 1 and 10
x = 1:10

% ------- create vectors that increment/decrement by some value ----------
% create vector whose elements increment by 0.1
x = 0:0.1:1

% create vector whose elements increment by -2
y = 10:-2:0

% create 3x3 matrix
A = magic(3)

% What is magic in matlab?

% index the first row
A(1,:)

% can you index the second and third column

%% Nesting
% a nested function is a function that is completely contained within a
   % parent function

   function parent
   disp('This is the parent function')
   nestedfx
   
       function nestedfx
           disp('This is the nested function')
       end
   end

   
%%% Functions are complicated and developing the skills to write them will
%%% take time. Above is a simple example of how one might be written in
%%% matlab with accompanying notaion.

%%% Why do you think functions might be useful?