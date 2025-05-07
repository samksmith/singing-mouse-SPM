
% extracting video data with original sampling rate (250 fps) - Exp. 1
[val_m,idx_m] = min(abs(video_time-startTimes(1)));
posEG = vidEG(idx_m);
posAE = vidAE(idx_m);
maxEG = max(vidEG);
minEG = min(vidEG);
maxAE = max(vidAE);
minAE = min(vidAE);

(posEG - minEG)/(maxEG - minEG) % percent EG moved
(maxAE-posAE)/(maxAE-minAE) % percent AE moved

% creating dataframe for video data want to analyze
outfileV = "/Volumes/Samsung_T5/dropbox_data/S. teguina/Analysis exp1/02_Adduction/ST302#004_videodata_orig.csv";
size_table = [size(video_time,2) 3];
varTypes = ["double","double","double"];
varNames = ["time","EG_point","AE_point"];
% actually make the empty table
video_df = table('Size',size_table,'VariableTypes',varTypes,'VariableNames',varNames);

vidtime = num2cell(video_time');
EGpt = num2cell(vidEG);
AEpt = num2cell(vidAE);

video_df(:,1) = vidtime;
video_df(:,2) = EGpt;
video_df(:,3) = AEpt;

writetable(video_df,outfileV,'WriteRowNames',true);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% extracting video data with original sampling rate (250 fps) - Exp. 2
% creating dataframe for video data want to analyze
outfileV = "/Volumes/Samsung_T5/dropbox_data/S. teguina/Analysis exp2/01_custom_step/STRed9#001_videodata_orig.csv";
size_table = [size(video_time,2) 5];
varTypes = ["double","double","double","double","double"];
varNames = ["time","EG_point","AE_point","glottal_area","Th_point"];
% actually make the empty table
video_df = table('Size',size_table,'VariableTypes',varTypes,'VariableNames',varNames);

vidtime = num2cell(video_time');
EGpt = num2cell(vidEG);
AEpt = num2cell(vidAE);
GApt = num2cell(GA');
Thpt = num2cell(vidTh);

video_df(:,1) = vidtime;
video_df(:,2) = EGpt;
video_df(:,3) = AEpt;
video_df(:,4) = GApt;
video_df(:,5) = Thpt;

writetable(video_df,outfileV,'WriteRowNames',true);