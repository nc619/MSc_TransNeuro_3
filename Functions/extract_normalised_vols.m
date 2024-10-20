function norm_table = extract_normalised_vols(stats_file)
    roi_keywords = {'Cerebellum-White-Matter', 'Cerebellum-Cortex', ...
                    'Caudate', 'Putamen', 'Pallidum', 'Thalamus', ...
                    'CC_Anterior', 'CC_Mid_Anterior', 'CC_Central', 'CC_Mid_Posterior', 'CC_Posterior'};
    
    regionNames = {};
    Normalised_Vol = [];
    
    fid = fopen(stats_file, 'r');
    if fid ~= -1
        while ~feof(fid)
            tline = fgetl(fid);
            
            if startsWith(tline, '#')
                continue;
            end
            

            formatSpec = '%d %d %d %f %s %f %f %f %f %f';
            data = textscan(tline, formatSpec, 'Delimiter', ' ', 'MultipleDelimsAsOne', true);
            
            if isempty(data{5}) || isempty(data{6})
                continue; % Skip empty or incorrect lines
            end
            
            structName = data{5}{1};  % Extract structure name (5th column)
            normVol = data{6};        % Extract normalized volume (6th column)
            
            for k = 1:length(roi_keywords)
                if contains(structName, roi_keywords{k}, 'IgnoreCase', true)
                    regionNames{end+1} = structName;  % Add structure name
                    Normalised_Vol(end+1) = normVol;  % Add normalized volume
                end
            end
        end
        fclose(fid);
    else
        error('Cannot open stats file: %s', stats_file);
    end
    
    norm_table = table(regionNames', Normalised_Vol', 'VariableNames', {'Region', 'Normalised_Volume'});
    
    disp(norm_table);
end
