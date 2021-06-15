%% For clarity, Dot Product will always refer to the traditional linear algebra vector operation that produces a scalar. Also, Matrix Multiplication will always refer to the traditional operation most comonly seen in linear algebra. Furthermore, Element-Wise Matrix Product will always refer to the operation that multiplies corresponding entries of two matrices (see figure: https://github.com/brainhack-uiowa/uibrainhack2021/blob/main/assets/images/elementwisematrixproduct.svg). 

% Create any column vector of length 5 and assign it to the variable Avec.

% Create a column vector from 5 to 20 in increments of pi. Assign this vector to the variable Bvec.

%% Dot product is an operation on two vectors that returns a scalar (i.e. a number). In MATLAB, 1-by-1 matrices and scalars are treated as the same thing (e.g. [4] == 4 is True). In MATLAB, the dot product can be produced by matrix multiplication with a row vector times a column vector. Recall that the transpose of a column vector is a row vector, and vice versa.

% Compute the dot product of Avec and Bvec.

%% Recall, matrix multiplication is an operation on two matrices that returns a matrix. This operation will take an n-by-m matrix times an m-by-p matrix and return an n-by-p matrix where n,m, and p are any positive integers.

% Create any 3-by-5 matrix however you would like and assign it to variable Cmat. Use the eye() function to create a 5-by-5 matrix and assign it to the variable ID5by5. Use matrix multiplication on Cmat and ID5by5.

% Use the eye() function to create a 3-by-5 matrix and assign it to the variable ID3by5. What are the dimensions of ID3by5'*Cmat? What about Cmat'*ID3by5?

%% Element-wise matrix product (also known as Hadamard's product) is an operation that operates on two matrices and returns a matrix. This operation is takes an n-by-m matrix times an n-by-m matrix and returns an n-by-m matrix.

% what is the element-wise product of ID3by5 and Cmat?

% What is the element-wise product of Avec and Bvec?

%% Cell arrays are not matrices, but matrices are cell arrays. Cell arrays may contain strings, numbers, or other arrays. Matrices only contain numbers.

% Create any 3-by-2 cell array that contains both strings and numbers and assign it to the variable D. What is the entry in the first row of the second column?

% Change the entry in the third row of the first column to your matrix Cmat.

%%% More Practice
A1 = [ 1 2 3; 3 4 5; 6 7 8]
v1 = [0:2:8]

A1*v1(1:3) % what happens and why?

A1*v1(1:3)' % what happens and why?

% How would you check the size of A1 and v1?

A1(1:2,3:4) % What happens and why?

% What is the data type for the the 4th element in A?

% What is the value of the 6th element in A1?

% Make the last 5 values of A1 zero

% Create two zero matrices h1 and n1 of size 8 by 8

% Replace the last five element of h1 with the number 2 and the last 5
% elements of n1 with the number 3. 

% what is the the element-wise-product of h1 and n1?
