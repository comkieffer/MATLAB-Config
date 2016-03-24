
%
% Open the specified path in the default file browser (linux only)
%
% The Unix version of MATLAB does not support 'Open in File Browser' so I
% implemented a basic version here. All modern linux distributions should
% support `xdg-open`
%
% To open the MATLAB userpath directory (Documents/MATLAB) run:
%
%   >> open_in_file_browser userpath
%

function open_in_file_browser(path)
    if ~exist('path', 'var'); path = '.'; end

    if strcmp(path, 'userpath')
        upath = userpath();
        path = upath(1:end-1);
    end    
    
    if ~exist(path, 'dir')
        warning('%s is not a folder', path)
        return
    end
    
    [status, stdout] = system(['xdg-open ', path]);
    if status ~= 0
        warning('xdg-open failed.\n  Status code: %i\n  stdout: %s', status, stdout);
    end
end