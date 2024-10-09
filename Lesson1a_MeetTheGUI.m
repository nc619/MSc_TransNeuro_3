%% Meet the GUI
%
% There is still no code here.
%
% The idea here is to remind me about all the things in the GUI that I want
% to show you.
%
%% Command window
% - Entering commands
%     type: x=5 
%     type: y=1:10; 
%     type: y=1:10
%     clc
%

%% Current folder
% - Current folder line
% -- Change folders
% 

%% Editor window
% Files with Matlab code have a  .m  ending
%
% This file is called 'Lesson1a_MeetTheGUI.m'
% file names must be in english and must start with a letter (and not with a number)
% It's usually better if your file names do not have spaces

% - See multiple files in the editor above
% - Line numbers on the left
% - Shading for the 'current cell'
% - If I press ctrl-enter, Matlab exectues the current cell

newVariable = 5;

%% Some more complicated code in a cell
for indexNum = 1:5
    numberList = 1:indexNum
    totalSum = sum(numberList);
    totalProd = prod(numberList);
    disp('Sum');
    disp(totalSum);
    disp('Product');
    disp(totalProd);
end;
% Orange line on right hand side: warning
% Red line: error

%% The documentation
doc mean
% - Function description
% - Search
% - F1



%% Workspace
% -- Variable editor
% -- Plots
% -- clear all
%
%% Command history
% -- Executing commands
% -- Create m-file
% -- Create shortcut
%

%% Pop-in & out


%% Next thing: Matlab Basics
open Lesson1b_MatlabBasics
