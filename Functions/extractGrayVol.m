function grayVol = extractGrayVol(stats_file)
    % Initialize variables to store data
    grayVol = NaN;  % Default in case of failure to read the file
    structNames = {};
    numVertices = [];
    surfArea = [];
    grayVols = [];
    thickAvg = [];
    thickStd = [];
    
    % Open and read the stats file
    fid = fopen(stats_file, 'r');
    if fid ~= -1
        % Read the file line by line
        while ~feof(fid)
            tline = fgetl(fid);
            
            % Skip lines that start with '#' (header/comment lines)
            if startsWith(tline, '#')
                continue;  % Skip this line
            end
            
            % Split the line into components
            tokens = strsplit(tline);
            
            % Only process lines that have at least 10 tokens (data rows)
            if length(tokens) >= 10
                structNames{end+1} = tokens{1};                  % Structure name
                numVertices(end+1) = str2double(tokens{2});      % Number of vertices
                surfArea(end+1) = str2double(tokens{3});         % Surface area (mm²)
                grayVols(end+1) = str2double(tokens{4});         % Gray matter volume (mm³)
                thickAvg(end+1) = str2double(tokens{5});         % Average thickness (mm)
                thickStd(end+1) = str2double(tokens{6});         % Thickness standard deviation (mm)
            end
        end
        fclose(fid);
        
        % Sum all gray matter volumes to return the total gray matter volume for the hemisphere
        grayVol = sum(grayVols);
    else
        error('Cannot open stats file: %s', stats_file);
    end
end