# singing-mouse-SPM
Data and code associated with Singing mouse sound production mechanism project larynx manipulation experiments. The results of these analyses are published as a pre-print here: https://doi.org/10.1101/2025.05.16.654575

Original files for analysis are .mat files (audio, air pressure, flow etc.) and .avi files (video) from the laryngeal recordings. The video files are visualized and rotated if necessary. We used DeepLabCut (v. 2.3) for video analysis. A separate DLC network was trained for each larynx. Config files and .csv files that are output from the DLC analysis are available in the Analysis exp1/DLC and Analysis exp2/DLC. Original videos and .mat files are hosted on the Texas Data Repository (https://doi.org/10.18738/T8/UA6GRO).

batch_analysis_exp1.m and batch_analysis_exp2.m are the main analysis files for the larynx manipulation experiments. They take the .mat and .csv files and plots subglottal air pressure, air flow, sound pressure, sound frequency, and landmark position across time. Other matlab files hosted here are called in the batch_analysis script. vid_data_extraction_originalfps.m takes landmark data (XY positions calculated in batch analysis scripts) and produces tables with pertinent landmark information used in R scripts.

Audio processing functions called in batch_analysis scripts = filter_signal, rms_Ajiboye.m, splineinterp_v2.m, tybutterNaN.m
Video processing functions = rotate_video.m, rotate_image_coordinates.m, geXYfromDLC.m, getXYfromDLC_exp2.m, getXYfromDLC_rotcoord_sks.m



