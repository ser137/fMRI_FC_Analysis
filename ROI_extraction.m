% 1.1 Find the hippocampal regions in the altas 
hipp_regions = atlas_subregions(contains(atlas_subregions.LeftAndRightHemisphere, 'Hipp'), :);

% 1.2 Find the label ID of the hippocampal regions 
hipp_ID_L1 = hipp_regions(1, :).LabelID_L;
hipp_ID_R1 = hipp_regions(1, :).LabelID_R;
hipp_ID_L2 = hipp_regions(2, :).LabelID_L;
hipp_ID_R2 = hipp_regions(2, :).LabelID_R;

% 1.3 Create logical matrices

hipp_L1_logical = (img_atlas == hipp_ID_L1);
hipp_L2_logical = (img_atlas == hipp_ID_L2);
hipp_R1_logical = (img_atlas == hipp_ID_R1);
hipp_R2_logical = (img_atlas == hipp_ID_R2);

%% 
% 2.1 Find name of hippocampal regions to conduct small lit review

region_names = hipp_regions.Var6;

region_name_1 = contains(region_names, 'rostral');
region_name_2 = contains(region_names, 'caudal');

for i = 1:length(region_names)
    if region_name_1(i)
        disp('Left rostral hippocampus ID = ')
        disp(hipp_ID_L1)

        disp('Right rostral hippocampus ID = ')
        disp(hipp_ID_R1)
    elseif region_name_2(i) 
        disp('Left caudal hippocampus ID = ')
        disp(hipp_ID_L2)

        disp('Right caudal hippocampus ID = ')
        disp(hipp_ID_R2)
    end
end

% 2.2 Selecting right caudal hippocampus

hipp_ROI = hipp_ID_R2;
hipp_ROI_logical = hipp_R2_logical;
hipp_ROI_n_vox = sum(img_atlas==hipp_ROI, 'all');


%% Second ROI - left inter-parietal SPL

SPL_regions = atlas_subregions(contains(atlas_subregions.Var6, 'A7ip'), :);
%%

% 3.1 Find the label ID of the left and right inter-parietal SPL
SPL_ID_L1 = SPL_regions(1, :).LabelID_L;
SPL_ID_R1 = SPL_regions(1, :).LabelID_R;

% 3.2. Selection of left inter-parietal SPL
SPL_ROI = SPL_ID_L1;
SPL_ROI_logical = (img_atlas == SPL_ROI);
SPL_ROI_n_vox = sum(img_atlas==SPL_ROI, 'all');







