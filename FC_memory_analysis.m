%% 1. Quantifying the relationship between WM and hipp-SPL connectivity
% 1.1 Create an array for WM test scores and functional connectivity
[WM_coeff, WM_p_value] = corr(WM_test_scores, FC_corr, 'Type', 'Pearson');

% 1.2 Display this as a table
WM_correlation = array2table([WM_coeff, WM_p_value], ...
    'VariableNames', {'WM Correlation', 'P Value'});

% 1.3 Display a message about the findings
WM_message = "The relationship between working memory (WM) score and the FC between the right caudal hippocampus " + ...
    "the superior parietal lobule (SPL) is " + WM_coeff + ". It has a p-value of " + WM_p_value + ". This result" + ...
    " failed to reach significance, but only just. It fails to reach significance by 0.0002, which leaves me" + ...
    " shedding an internal tear. Alas, this result suggests that WM is not affected by hippcampus-SPL FC.";

disp(WM_correlation);
disp(WM_message);

%% 2. Quantifying the relationship between episodic memory and hipp-SPL connectivity
[episodic_coeff, episodic_p_value] = corr(episodic_test_scores, FC_corr, 'Type', 'Pearson');

episodic_correlation = array2table([episodic_coeff, episodic_p_value], ...
    'VariableNames', {'Episodic Correlation', 'P Value'});
        % 0.0002 away from significance, weep weep weep

episodic_message = "The relationship between episodic memory (EM) score and the FC between the right caudal hippocampus " + ...
    "the superior parietal lobule (SPL) is " + episodic_coeff + ". It has a p-value of " + episodic_p_value + ". This result" + ...
    " failed to reach significance, and suggest that EM is not affected by hippocampus-SPL FC.";
disp(episodic_correlation);
disp(episodic_message);

%% 3. Create figure showing the Pearson's R for hipp-SPL FC and WM across participants
% 3.1 Create à colour for each participant
cmap = lines(10); % 'lines' provides distinct colors
% 3.2 Define figure size and allow figure to be updated with each iteration
% of the for loop (hold on)
figure;
set(gcf, 'Position', [100, 100, 800, 600]);
hold on;

% 3.3 Create a point/handle for each participant
scatter_handles = gobjects(10,1);
for i = 1:10
    % 3.4 Define point value for each participant based on the FC and WM
    % score, define size and colour of each point
    scatter_handles(i) = scatter(FC_corr(i), WM_test_scores(i), 100, cmap(i,:), 'filled');
end

% 3.5 Creation of key showing which point corresponds to which participant
legend(scatter_handles, ppt_name, 'Location', 'bestoutside');

% 3.6 Axis labels
xlabel('Functional Connectivity Score');
ylabel('Working Memory Test Scores');

% 3.7 Tidy up the graphic a little, move title slightly up
t = title('Scatter showing Participant H-SPL Functional Connectivity and WM Test Scores');
t.Position(2) = t.Position(2) + 0.05;

grid on;
hold off;

% 3.8 Save the scatter plot as a .png file
exportgraphics(gcf, 'WM_scatter_plot.png');

%% 4. Create figure showing the pearsons R for hipp-SPL FC and EM across participants
% as above
figure;
set(gcf, 'Position', [100, 100, 800, 600]);
hold on;

scatter_handles = gobjects(10,1);
for i = 1:10
    scatter_handles(i) = scatter(FC_corr(i), episodic_test_scores(i), 100, cmap(i,:), 'filled');
end

legend(scatter_handles, ppt_name, 'Location', 'bestoutside');

xlabel('Functional Connectivity Score');
ylabel('Working Memory Test Scores');

t = title('Scatter showing Participant H-SPL Functional Connectivity and EM Test Scores');
t.Position(2) = t.Position(2) + 0.05;
grid on;
hold off;

exportgraphics(gcf, 'episodic_scatter_plot.png');