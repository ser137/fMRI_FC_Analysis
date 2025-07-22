%% Inhibitory Attention and hippocampus-SPL connectivity
attention_scores = test_scores.NIHToolbox_flanker_inhibitory_control_attention;

[attention_coeff, attention_p_value] = corr(attention_scores, FC_corr, 'Type', 'Pearson');

attention_correlation = array2table([attention_coeff, attention_p_value], ...
    'VariableNames', {'Attention Inhibition Correlation', 'P Value'});

attention_message = "The relationship between attention inhibiton and the FC between the right caudal hippocampus " + ...
    "the superior parietal lobule (SPL) is " + attention_coeff + ". It has a p-value of " + attention_p_value + ". This result" + ...
    " failed to reach significance, and suggest that EM is not affected by hippocampus-SPL FC.";
disp(attention_correlation);
disp(attention_message);


%% Manual dexterity
dexterity_scores = test_scores.NIHToolbox_9hole_pegboard_dexterity;

[dexterity_coeff, dexterity_p_value] = corr(dexterity_scores, FC_corr, 'Type', 'Pearson');

dexterity_correlation = array2table([dexterity_coeff, dexterity_p_value], ...
    'VariableNames', {'Manual Dexterity Correlation', 'P Value'});

dexterity_message = "The relationship between manual dexterity and the FC between the right caudal hippocampus " + ...
    "the superior parietal lobule (SPL) is " + dexterity_coeff + ". It has a p-value of " + dexterity_p_value + ". This result" + ...
    " failed to reach significance, and suggest that EM is not affected by hippocampus-SPL FC.";
disp(dexterity_correlation);
disp(dexterity_message);

%% Language
language_scores = test_scores.NIHToolbox_oral_reading_recognition;

[language_coeff, language_p_value] = corr(language_scores, FC_corr, 'Type', 'Pearson');

language_correlation = array2table([language_coeff, language_p_value], ...
    'VariableNames', {'Language Correlation', 'P Value'});

language_message = "The relationship between language skill and the FC between the right caudal hippocampus " + ...
    "the superior parietal lobule (SPL) is " + language_coeff + ". It has a p-value of " + language_p_value + ". This result" + ...
    " failed to reach significance, and suggest that EM is not affected by hippocampus-SPL FC.";
disp(language_correlation);
disp(language_message);

%% Repetitive Vocabulary
picture_scores = test_scores.NIHToolbox_picture_vocabulary;

[picture_coeff, picture_p_value] = corr(picture_scores, FC_corr, 'Type', 'Pearson');

picture_correlation = array2table([picture_coeff, picture_p_value], ...
    'VariableNames', {'Picture Correlation', 'P Value'});

picture_message = "The relationship between language and repetive vocabulary with the FC between the right caudal hippocampus " + ...
    "the superior parietal lobule (SPL) is " + picture_coeff + ". It has a p-value of " + picture_p_value + ". This result" + ...
    " failed to reach significance, and suggest that EM is not affected by hippocampus-SPL FC.";
disp(picture_correlation);
disp(picture_message);

%% Non-Verbal Intelligence and hippocampus-SPL connectivity
KBIT_filepath = [pwd, '\dataset\participant_info\KBIT2.tsv'];

KBIT_scores = readtable(KBIT_filepath, "FileType","text",'Delimiter', '\t');

nonverbal_scores = KBIT_scores.KBIT2_nonverbal_standard;

[nonverbal_coeff, nonverbal_p_value] = corr(nonverbal_scores, FC_corr, 'Type', 'Pearson');

nonverbal_correlation = array2table([nonverbal_coeff, nonverbal_p_value], ...
    'VariableNames', {'Non-verbal Correlation', 'P Value'});

nonverbal_message = "The relationship between non-verbal intelligence as measured by the KBIT2 inventory and the FC between the right caudal hippocampus " + ...
    "the superior parietal lobule (SPL) is " + nonverbal_coeff + ". It has a p-value of " + nonverbal_p_value + ". This result" + ...
    " failed to reach significance, and suggest that EM is not affected by hippocampus-SPL FC.";
disp(nonverbal_correlation);
disp(nonverbal_message);

