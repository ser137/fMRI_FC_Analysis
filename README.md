# fMRI_FC_Analysis

A brief summary of the MATLAB scripts for an assignment looking at hippocampal FC with episodic and working memory.

Files must be within the main project folder (i.e., the main wd must contain the sub folders 'assignment', 'atlas', 'dataset' and following files)

1. master_script
- script which runs all of the following matlab scripts on the dataset
- it is recommended to open this script and run it

2. data_inspection
- loading and inspecting participant data, including extraction of name, age and gender
- creation and saving of a histogram .png file which shows the distribution of participant age
- loading and inspecting the test score data, including extraction of working memory (WM) and episodic memory (EM) test scores
- calculating mean and standard deviation of both memory scores

3. MRI_data_inspection
- loading the MRI atlas, both the .nii and accompanying spreadsheet information
- loading participant fMRI data from their respective directories
- checking suitability of data for further analysis
	- checking the number of volumes (i.e. timeseries) of each participant
	- checking that the size of the atlas matches the size of the participant data
	- if there is a discrepancy, the script stops running here

4. ROI_extraction
- extracting hippocampal regions from the atlas excel sheet
- from the hippocampal identifiers from the atlas excel, creating a logical matrix which extracts these from the atlas
- selection of hippocampal ROI and extraction of corresponding atlas voxels
- extracting superior parietal lobule (SPL) regions from the atlas excel sheet
- finding SPL identifiers to extract the ROI (left inter-parietal SPL) and its corresponding voxels

5. BOLD_extraction
- creation of a mean BOLD signal over time for each participant for each ROI
- saving the data for each participant in their respective folder

6. funct_connectivity_analysis
- creation of functional connectivity (FC) matrix and p-value matrix for each participant
- filling this matrix with each participants FC score and p-value
- testing significance with an alpha value of 0.05
- displaying a table showing each participants FC, p-value and significance testing, with an explanatory message

7. FC_memory_analysis
- creation of Pearson's R with each participants hipp-SPL FC score and their WM and EM score as extracted in data_inspection
- creating colour-coded scatter plot where each point is the Pearson's R of each participant, labelled with a key
	- one scatterplot showing the relationship between FC and WM
	- one scatterplot showing the relationship between FC and WM
- saving each scatterplot in the wd as a .png file

8. bonus_analysis
- creation of Pearson's R with each participants hipp-SPL FC score and multiple different measures
	- inhibitory attention
	- manual dexterity
	- language skill
	- repetitive vocabulary
	- non-verbal intelligence
- commented out of the master_script given that it is not strictly speaking part of the core task. Must be uncommented to run
