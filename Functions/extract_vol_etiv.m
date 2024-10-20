function nonnorm_table = extract_vol_etiv(stats_file)
    roi_keywords = {'Cerebellum-White-Matter', 'Cerebellum-Cortex', ...
                    'Caudate', 'Putamen', 'Pallidum', 'Thalamus', ...
                    'CC_Anterior', 'CC_Mid_Anterior', 'CC_Central', 'CC_Mid_Posterior', 'CC_Posterior'};
    
    regionNames = {};
    Volume_mm3 = [];
    eTIV = NaN;
    
    fid = fopen(stats_file, 'r');
    if fid ~= -1
        while ~feof(fid)
            tline = fgetl(fid);
            
            if startsWith(tline, '#')
                if contains(tline, 'EstimatedTotalIntraCranialVol')
                    tokens = strsplit(tline, ',');
                    eTIV = str2double(strtrim(tokens{4}));
                end
                continue;
            end
            
            formatSpec = '%d %d %d %f %s %f %f %f %f %f';
            data = textscan(tline, formatSpec, 'Delimiter', ' ', 'MultipleDelimsAsOne', true);
            
            if isempty(data{5}) || isempty(data{4})
                continue;
            end
            
            structName = data{5}{1};  % Extract structure name (5th column)
            vol = data{4};            % Extract volume (4th column)

            for k = 1:length(roi_keywords)
                if contains(structName, roi_keywords{k}, 'IgnoreCase', true)
                    regionNames{end+1} = structName;  % Add structure name
                    Volume_mm3(end+1) = vol;         % Add volume
                end
            end
        end
        
        fclose(fid);
    else
        error('Cannot open stats file: %s', stats_file);
    end

    if isempty(regionNames)
        disp(['The table for ', stats_file, ' is empty.']);
        nonnorm_table = table();  % Return an empty table
    else
        nonnorm_table = table(regionNames', Volume_mm3', 'VariableNames', {'Region', 'Volume_mm3'});
        nonnorm_table.eTIV = repmat(eTIV, height(nonnorm_table), 1);  % Add eTIV column
    end
end
