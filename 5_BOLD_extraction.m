%% For loop for BOLD_extraction
% 1.1 Loop through each participant
for i = 1:participant_scans
    % 1.2 Extract participant fMRI data which was imported during
    % MRI_data_inspection
    participant_scan = img_ppt{i};
    
    % 1.3 Find specific participant folders in the wd
    participant_folder = fullfile(participant_wd, participant_folders(i).name);

    % 1.4 Create empty matrices for the voxels of the ROI
    mat_voxel_ts_hipp = nan(hipp_ROI_n_vox, n_volumes);
    mat_voxel_ts_SPL = nan(SPL_ROI_n_vox, n_volumes);

    % 1.5 Creation of BOLD signal value for each participant across time
    % (i.e. number of volumes)
    BOLD_ROI_hipp = nan(1, n_volumes);
    BOLD_ROI_SPL = nan(1, n_volumes);

    for v = 1:n_volumes
        % 1.6 Extract the MRI data for each participant across time, and
        % extract the time series for the hippocampus ROI using the logical
        % matrix created earlier
        tmp_hipp = participant_scan(:, :, :, v);
        tmp2_hipp = tmp_hipp(hipp_ROI_logical); 

        % 1.7 Store extracted BOLD signals, and create a mean BOLD signal
        % over time for each participant
        mat_voxel_ts_hipp(:, v) = tmp2_hipp; % Store extracted voxel values
        BOLD_ROI_hipp(v) = mean(tmp2_hipp);  % Extract mean BOLD signal

        % 1.8 Extraction of MRI, time series and storage of mean BOLD for
        % each participant for second ROI (SPL)
        tmp_SPL = participant_scan(:, :, :, v);
        tmp2_SPL = tmp_SPL(SPL_ROI_logical);

        mat_voxel_ts_SPL(:, v) = tmp2_SPL;
        BOLD_ROI_SPL(v) = mean(tmp2_SPL);
    end

    % 1.9 Creation of file for each BOLD signal in the respective
    % participant folder
    hipp_filename = fullfile(participant_folder, 'BOLD_ROI_hipp.mat');
    SPL_filename = fullfile(participant_folder, 'BOLD_ROI_SPL.mat');

    % 2 Save the BOLD signal
    save(hipp_filename, 'BOLD_ROI_hipp');
    save(SPL_filename, 'BOLD_ROI_SPL');
end


