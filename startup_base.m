

MATLAB_EXTENSIONS = {'.m', '.p' '.slx'};

base_dir = pwd();
paths = genpath('.');

folders = strsplit(paths, pathsep);

new_paths = '';
for k = 1:length(folders)
    folder = folders{k};
    folder = folder(2:end); % Strip out the initial '.' character
    
    % Exclude '.' and '..' from the listing.
    if isempty(folder) || strcmp(folder, '.')
        continue
    end
    
    % Exclude folders that do not contain *.m files
    files = dir(strcat(base_dir, folder));
    
    m_files = cell(0);
    for l = 1:length(files)
        [~, name, ext] = fileparts(files(l).name);
        if find(strcmp(ext, MATLAB_EXTENSIONS))
            m_files{end+1} = name;
        end
    end
    
    % If the folder has at least one *.m file we add it to the path and print a
    % message to the screen.
    if ~isempty(m_files)
        abs_path = strcat(base_dir, folder);
        new_paths = strcat(new_paths, abs_path, ';');

        % Truncate paths that are longer than MAX_PATH_LEN
        MAX_PATH_LEN = 80;
        if length(abs_path) > MAX_PATH_LEN 
            [path, file, ext] = fileparts(abs_path);

            remaining_chars = MAX_PATH_LEN - 1 - length(file) - length(ext);

            if length(path) > remaining_chars
                path = strcat(path(1:remaining_chars-3), '...');
            end

            abs_path = strcat(path, '/', file, ext'); 
        end
        
        fprintf('Adding %s \n', abs_path);
        
        for l = 1:length(m_files)
            fprintf('  Provides: %s\n', m_files{l});
        end
    end
end

% Actually add all the folders to the path
addpath(new_paths);

% Clean up
clear all
