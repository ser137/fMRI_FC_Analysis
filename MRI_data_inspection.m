%% ROI extraction
% 1.1 - Load the Atlas MRI File (3D)
atlas_file = [pwd, '\atlas\BN_Atlas_246_2mm.nii'];
img_atlas = niftiread(atlas_file);
hdr_atlas = niftiinfo(atlas_file);

% 1.2 - Load atlas excel sheet
atlas_excel = [pwd, '\atlas\BNA_subregions.xlsx'];

atlas_subregions = readtable(atlas_excel);

% 1.3 - Calculate the number and size of the dimensions of the atlas
img_atlas_nDims = ndims(img_atlas);
hdr_atlas_nDims = ndims(hdr_atlas);

hdr_atlas_size = hdr_atlas.ImageSize;


%% 2 - Participant fMRI Data
% 2.1 - Load the participant MRI scans (4D)

participant_wd = fullfile(pwd, 'dataset', 'mri_scans');

participant_folders = dir(participant_wd);
participant_folders = participant_folders([participant_folders.isdir]);
participant_folders = participant_folders(~ismember({participant_folders.name}, {'.', '..'}));

participant_scans = length(participant_folders);
img_ppt = cell(participant_scans, 1);
hdr_ppt = cell(participant_scans, 1);

for i = 1:participant_scans
    participant_folder = fullfile(participant_wd, participant_folders(i).name);
    
    niiFiles = dir(fullfile(participant_folder, '*.nii'));

    
    filePath = fullfile(niiFiles(1).folder, niiFiles(1).name);
    
    img_ppt{i} = niftiread(filePath);
    hdr_ppt{i} = niftiinfo(filePath);
end

% creating a matrix for ease of future comparisons
hdr_ppt_Size_matrix = [];

for i = 1:participant_scans
    if ~isempty(hdr_ppt{i})
        hdr_ppt_Size_matrix = [hdr_ppt_Size_matrix; hdr_ppt{i}.ImageSize];
    end
end
%%
% 2.3. 1 - Calculate the number and size of the dimensions of the participant
% MRI files.

ppt_nDims = cellfun(@ndims, img_ppt);
ppt_sizes = cellfun(@size, img_ppt, 'UniformOutput', false);
    
%%

% 2.3.2 - Do all participants have the same number of volumes in their
% scans?
n_volumes = hdr_ppt_Size_matrix(:, end);

if all(n_volumes == n_volumes(1))
    disp('The fMRI data from all participants has the same number of volumes.')
else
    error('Data size is not uniform and may be problematic for further analyses.')
end
%%
n_volumes = n_volumes(1);

%% 3 - Comparing the atlas with the participant data
% 3.1 - Do the dimensions of the atlas and participant files match?
ppt_dims = hdr_ppt_Size_matrix(:, 1:3);

if hdr_atlas_size == ppt_dims
    disp('The size of the participant data matches the Brainnetome atlas.')
else
    error('The size of the participant data does not match the atlas on file and may be problematic for further analyses.')
end