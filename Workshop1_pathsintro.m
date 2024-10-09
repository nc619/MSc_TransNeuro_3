% Intro to paths
% The Basics
% Most programming languages and software, including MATLAB, use the concept of paths.
% You have most likely encountered paths before, when looking for something in your directory. These can look something of the form:
% "C:\Users\nicol\MSc_TransNeuro_Mod3"
% Paths therefore indicate the path your computer has to follow, in order to find a desired folder or file in your memory. In MATLAB, you can see your current path at the top of the user interface:
% 
% This allows MATLAB to know where to look for files.
% Syntax of Paths
% Paths have a particular syntax, for both Mac and Windows, you can use 
% "/"
% As the separator character between folders
% WINDOWS: 
% In Windows paths start with your hard drive, which is given a letter, most commonly starting at C: 
% A common Windows path can look like: "C:\Users\nicol\MSc_TransNeuro_Mod3"
% NOTE: Here the path separator is the backslash "\" instead of the normal slash "/". This is because windows uses the backslash as default, but the normal slash still works in MATLAB.
% MAC/LINUX: 
% In UNIX-based systems (MacOS or Linux), the paths start with a slash character "/", followed by a series of folders.
% An example of a common UNIX path can look like: "/home/nicol/MSC_TransNeuro_Mod3".
% Adding paths to MATLAB
% If MATLAB only used the path you currently have open in the GUI's top search bar to look for files, it would be limited in use-cases.
% To solve this, you use matlab's addpath function, to tell it where to look.
% For example, if you try to run the following code:
%% Cell1
my_sum(1,3)
% You will receive an error message saying this function was not found in the path.
% To tell MATLAB where to find it, we can add the Functions folder to the path, and try again:
%% Cell2
disp(path)

addpath("Functions")
my_sum(1,3)


