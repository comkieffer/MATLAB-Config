
% Load all the subfolders into the path:
addpath( genpath( pwd() ) );

% Set some sane defaults for graphing: 

set(0, 'defaultAxesXGrid', 'on');
set(0, 'defaultAxesYGrid', 'on');
set(0, 'defaultAxesZGrid', 'on');

% Make the output denser 
format compact

% Suppress the 'MEvent. CASE!' message that occurs on linux when using a two
% finger scroll gesture.
!synclient HorizTwoFingerScroll=0
