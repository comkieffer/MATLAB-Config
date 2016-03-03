
%
% Hacky way of making projects in MATLAB
%
% One hassle of MATLAB is that moving from one project to another is a hassle.
% With this script you only have to type:
%
%   open_project 'my project' 
%
% to move from the currrent directory to the specififed directory. Projects are
% simply folders in the one of the 'project_folders'.
%
% To list all the currently detected projects use: 
%
%   open_project --list
%

function open_project(project_name)
    
    project_folders = {
        '/project/1/folder'
        '/project/2/folder'
    };

    if strcmp(project_name, '--list')
       list_projects(project_folders);
       return
    end

    for k = 1:length(project_folders)
        path = fullfile(project_folders{k}, project_name);
        
        if exist(path, 'dir')
            fprintf('Found project. Changing directory to %s\n', path');
            cd(path);
            return; 
        end
    end
    
    fprintf('Unable to locate project %s\n', project_name);
end

function list_projects(project_folders)
    for k = 1:length(project_folders)
       fprintf('Projects in <%s>:\n', project_folders{k});
       
       folders = dir(project_folders{k});
       
       for j = 1:length(folders)
          if folders(j).isdir &&  ~strcmp(folders(j).name, '.') && ~strcmp(folders(j).name, '..')
            fprintf('    %s\n', folders(j).name);  
          end
       end
    end
end