%% 1. Demographic Data
% 1.1 - Loading Demographics
demo_filepath = [pwd, '\dataset\participant_info\participants.xlsx'];

ppt_info = readtable(demo_filepath);

ppt_name = ppt_info.participant_id;

% 1.2 - Calculate the mean age
ppt_ageMean = mean(ppt_info.age);

% 1.3 - Calculate the age SD
ppt_ageSD = std(ppt_info.age);

% 1.4 - Calculate the number of males and females
ppt_male = sum(strcmp(ppt_info.gender, 'M'));

ppt_female = sum(strcmp(ppt_info.gender, 'F'));


% 1.5 - Create a figure to visualise the distribution of ages
figure
ppt_ageDistrubution = histogram(ppt_info.age, 'FaceColor', '#d8b9ff')

title('Histogram showing the Distribution of Participant Age')

xlabel('Age of Participant')
ylabel('Number of Participants')
yticks(ceil(min(ylim)):floor(max(ylim)))

exportgraphics(gcf, 'ppt_ageDistribution.png');

%% 2 Neurophysiological Test Score Data
% 2.1 - Load the data
neuro_filepath = [pwd, '\dataset\participant_info\NIH_Toolbox.tsv'];

test_scores = readtable(neuro_filepath, "FileType","text",'Delimiter', '\t');
            % gives a table         

% 2.2 - Find the episodic and WM Scores
episodic_test_scores = test_scores.NIHToolbox_picture_sequence_memory;

WM_test_scores = test_scores.NIHToolbox_list_sorting_working_memory;

% 2.3 - Caluclate the mean and SD of the episodic and WM scores
episodicMean = mean(episodic_test_scores);

episodicSD = std(episodic_test_scores);


wmMean = mean(WM_test_scores);

wmSD = std(WM_test_scores);
