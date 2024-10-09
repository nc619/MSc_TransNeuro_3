%% Matlab basics
% The idea is to lay out the basic building blocks and name them

%% Scalars

% This is a scalar
a = 5

% Here is another
b = 6

% Here is their sum
disp(a+b)
% Here is their product
disp(a*b)
% More math
c = ((a+b) / (a*b))^(a^b)


%% Functions

% Here is a function applied to a scalar
c = sin(a)

% Here is a function applied to two scalars
c = max(a,b)



%% Vectors

% This is a row vector
a = [4 5 6]

% This is a column vector
b = [1; 2; 3]
% But I can also use the transpose operator
b = [1 2 3]'

% You can get their lengths
c = length(a)

% You can multiply a row by a column vector
c = a*b
% Sometimes in two different ways
c = b*a
% But don't try to add them
%c = a + b
% Unless you use the transpose first
c = a + b'

% We can also multiply element-by-element
c = a .* b'
% Or divide
c = a ./ b'

% This is a vector of length 0
a = []
c = length(a)

%% Building vectors

% We can build vectors using the : operator
a = 1:5
b = 2:7:20
c = 10:-1:1

% Or put two together with concatenation
c = [a b]


%% Vectors and functions

% We can apply a function to a vector
mean(a)

median(a)

std(a)


% Even if it is very long
a = rand(1000,1);

mean(a)

median(a)

std(a)

%% Matrixes

% Here is a matrix
a = [1 2; 3 4; 5 6]

% Here is another
b = eye(3)

% We can multiply them if the size is right
c = b*a
% But not if it's not
%c = a*b

% Or add them
c = rand(3)

b+c

% Or two elementwise operations
d = b.*c

d = b.^2
d = b.^c

d = b ./ b
d = c ./ c

% You can turn a matrix into a vector
b(:)
% or pick a vector from a matrix
b(:,3)
b(3,:)
b(2,3)


%% Matrixes and functions
b = magic(3);

% Some functions operate on an entire matrix
det(b)

% And some operate on the columns
sum(b)
% those can usually be made to operate on the rows, too
sum(b,2)
% Or you can use the transpose
sum(b')

% The logic of column operations
b = rand(10,5);
c = mean(b)
std(c)

% We can compose functions
std(mean(b))



%% Manipulating variables in the workspace

% Get rid of the a variable
clear a

% Save all the variables
save BasicIntro

% Scary
clear all

% Lucky us
load BasicIntro

% We can be more selective
clear all
load BasicIntro c d

% We can also be more selective about saving
save BasicIntro a
whos -file BasicIntro

%% Programming constructs

%% For loops
A = rand(10,10);
for colNum = 1:10
    disp(sum(A(:,colNum)));
end;

%% That's the same as
sum(A)


%% Timing of for loops
% Check out the difference in time

A = rand(10,100000);
numCols = size(A,2);
meanMax = 0;

tic;
for colNum = 1:size(A,2)
    meanMax = meanMax + max(A(:,colNum));
end;
meanMax = meanMax / numCols;
toc;

disp(meanMax);


%% timing of vector operation
% That's the same as

disp('vector operation:');
tic;
C = mean(max(A));
toc;

disp(C);


%% If statements
A = rand(1,100);
if ~any(A < 0.1)
    disp('0.1 is smaller');
end;

if all(A < 0.9)
    disp('0.9 is larger');
elseif all(A < 0.99)
    disp('0.99 is larger');
else
    disp('They''re all so big');
end;

% Or we can use a loop
maxVal = 0.9;
Exp = 1;
while ~all(A < maxVal)
    Exp = Exp + 1;
    maxVal = maxVal + 9*10^(-Exp);
end;
disp('This value is bigger than all of A');
disp(maxVal);



%% Switch statements
userNum = input('type a number between 0 and 10: ');
switch userNum
    case 0
        disp('You are zero');
    case 1
        disp('You are the unit for multiplacation');
    case {2, 4, 6, 8, 10}
        disp('You are even');
    case {3, 5, 7}
        disp('You are prime');
    otherwise
        disp('You are 9');
end;
