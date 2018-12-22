function [] = SobelPicToEdge( path )
files = GetFilesFromDir(path);
for i = 1 : length(files)
    file_name = strjoin(files(i));
    I = rgb2gray(imread(strcat(path, '\', file_name)));
    
    [~, threshold] = edge(I, 'sobel');
    fudgeFactor = .5;
    BWs = edge(I,'sobel', threshold * fudgeFactor);
    imwrite(BWs, strcat(path, '\edge_' , file_name));
end
end

