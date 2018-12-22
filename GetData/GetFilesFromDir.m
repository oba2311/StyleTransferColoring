function [ files ] = GetFilesFromDir( dir_path )
files = {};
Files = dir(dir_path);
files_added = 1;
for k=1:length(Files)
    if Files(k).isdir == 1
        continue;
    end
    name = Files(k).name;
    files{files_added} = name;
    files_added = files_added + 1;
end
end

