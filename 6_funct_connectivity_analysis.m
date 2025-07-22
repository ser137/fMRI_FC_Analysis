% 1. Create matrix for the FC and p-values for the participants
FC_corr = nan(participant_scans, 1);
p_values = nan(participant_scans, 1); % Initialize array for p-values

% 2. For loop to find FC and p-value for each participant
for i = 1:participant_scans
    % 2.1 Find and load the data for each participant
    participant_folder = fullfile(participant_wd, participant_folders(i).name);

    hipp_filename = fullfile(participant_folder, 'BOLD_ROI_hipp.mat');
    SPL_filename = fullfile(participant_folder, 'BOLD_ROI_SPL.mat');

    load(hipp_filename, 'BOLD_ROI_hipp');
    load(SPL_filename, 'BOLD_ROI_SPL');

    % 2.2 Store the BOLD signal for each participant in one varible per ROI
    BOLD_ROI_hipp_all(i) = BOLD_ROI_hipp(i);

    BOLD_ROI_SPL_all(i) = BOLD_ROI_SPL(i);

    % 2.3 Find stength of FC between the two ROI as denoted by pearsons R value
    [FC_corr(i), p_values(i)] = corr(BOLD_ROI_hipp', BOLD_ROI_SPL', 'Type', 'Pearson');
end

% 3. Test significance
significant = p_values<0.05;

% 4. Create a table showing FC between hipp-SPL for each participant
results_table = array2table([FC_corr'; p_values'; significant'], ...
    'RowNames', {'Pearson_Correlation', 'p_Value', 'Significant? (1:Y, 0:N)'}, ...
    'VariableNames', compose("SUB_MSC%02d", 1:participant_scans));

% 5. Display the FC table with an explanatory message
results_message = "The table above displays the functional connectivity between two selected ROI," + ...
    "the right caudal hippocampus and the left superior parietal lobule. The strength of the connectivity" + ...
    "is denoted by the Pearson_Correlation value. A value of -1 iinfers strong inverse communication" + ...
    "connectivity (FC) between two areas. To clarify, in the case of this data, a FC of -1 would denote" + ...
    "that the right caudal hippocampus is very active when the left SPL is not, which is temporally linked," + ...
    "and vice versa. A value of 1 infers a strong communication between the two regions, so as one becomes" + ...
    "more active, so does the other. This is demonstrated across time. A score of 0 infers no FC. The closer" + ...
    "the score is to 0, the weaker the connection between the two regions. Whether this connectivity is" + ...
    "significant or not is denoted by the row labelled significant. 1 means that this FC is statistically" + ...
    "signiciant, 0 means that it failed to reach significance.";

disp(results_table);
disp(results_message);



