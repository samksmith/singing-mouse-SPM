% Define general signal processing parameters
highPass = 2500;
lowPass = 990000;
FrBinwidth=10;
min_ShannonsEntropy = 0.4;

min_frequency = 15000;
max_frequency = 90000;

% Define folder master folder
master_folder = "";

% Define treatment folders
treatment_folders = ["01_No treatment", ...
    "02_Adduction", ...
    "03_PouchFill", ...
    "03b_PouchEmpty", ...
    "04_Cut Alar"]';

% Define list of trials
trials{1} = [];
trials{2} = [];
trials{3} = [];
trials{4} = [];
trials{5} = [];

% Define parameters for storing sound pressure or subglottal pressure
sp_array = [];
sp_array_db = [];
sp_array_kPa = [];
sp_trial_name = string([])
sp_individual = string([]);

sp_on_according_to_yin = []; % to determine if point should be included or not
sp_on_according_to_entropy = [];

sp_trial_number_TEMP = 0;
sp_treatment_number_array = [];
mic_distance = 0.039;
rms_window_length = 500;

% Loop over treatments
for treatment = 1 %1:5
    treatment_folder = fullfile(master_folder,treatment_folders(treatment));
    % Loop over trials
    for trial_number = 1:numel(trials{treatment})
        trial = trials{treatment}(trial_number);
        % define parameters for larynx run
        switch trial
            case "ST045#001"
                % [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                tst=2; tend=6;
                % freq range of sound in hz
                f0range=[15000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 0; % In the folder containing the video file, there is a file called
                % _config.xsv, there is an entry called Per-Trig-Frms, it
                % contains the pre-trigger measured in frames
                % landmark value from video data
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 0;
            case "ST046#001"
                tst=2; tend=6.5;
                f0range=[15000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 19;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 0;
             case "ST049#001"
                tst=2; tend=6.5;
                f0range=[15000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 19;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 0;
             case "ST302#001"
                tst=2; tend=5.5;
                f0range=[15000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 1;
                epiglottis_point = 15;
                AE_point = 20;
                rotated_coords = 1;
                EG4coord = 0;
             case "ST306#001"
                tst=2.5; tend=5.5;
                f0range=[15000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 2;
                epiglottis_point = 15;
                AE_point = 20;
                rotated_coords = 1;
                EG4coord = 0;
            case "ST901#001"
                tst=1; tend=6.5;
                f0range=[15000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 0;
                epiglottis_point = 15;
                AE_point = 20;
                rotated_coords = 1;
                EG4coord = 0;
            case "ST921#001" % no video file for this one
                tst=2; tend=8;
                f0range=[15000 80000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 0;
                epiglottis_point = 15;
                AE_point = 20;
                rotated_coords = 0;
                EG4coord = 0;
            case "STRed5#001"
                tst=1.5; tend=5.5;
                f0range=[15000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 1;
                epiglottis_point = 15;
                AE_point = 20;
                rotated_coords = 1;
                EG4coord = 0;
            case "ST045#005"
                tst=3.8; tend=6.2;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[25000 70000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 0;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 0;
            case "ST045#006"
                tst=3.6; tend=5;
                f0range=[25000 65000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 0;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 0;
            case "ST045#007"
                tst=0.5; tend=8.5;
                f0range=[20000 80000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 0;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 0;
             case "ST046#005"
                tst=1.5; tend=6;
                f0range=[20000 80000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 19;
                AE_point = 15; 
                rotated_coords = 0;
                EG4coord = 1;
            case "ST046#006"
                tst=0.1; tend=8.5;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 19;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 1;
            case "ST046#007"
                tst=1.5; tend=5.5;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 80000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 19;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 1;
            case "ST049#006"
                tst=0.1; tend=6.5;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[5000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 19;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 1;
            case "ST049#007"
                tst=0.1; tend=8.5;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 19;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 1;
            case "ST302#002"
                tst=4; tend=5;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "ST302#003"
                tst=0.5; tend=7;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "ST302#004"
                tst=0.3; tend=6;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 65000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
             case "ST302#005"
                tst=0.5; tend=6;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 65000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
             case "ST306#002"
                tst=2; tend=5.3;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 100000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 2;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
             case "ST306#003"
                tst=0.5; tend=7;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 80000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 2;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "ST306#004"
                tst=0.5; tend=7.3;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "ST306#005"
                tst=0.5; tend=7.2;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "ST306#006"
                tst=0.2; tend=9.5;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[15000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "ST306#007"
                tst=0.1; tend=12;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 70000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 3;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "ST901#011"
                tst=0.1; tend=4;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 80000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 0;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "ST901#012"
                tst=2; tend=6;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[40000 70000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 0;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "ST921#005"
                tst=0.9; tend=10;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 80000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 0;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 0;
            case "ST921#006"
                tst=0.5; tend=4;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 0;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 0;
            case "ST921#007"
                tst=1.5; tend=4;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[30000 70000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 0;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 0;
            case "STRed5#002"
                tst=1.8; tend=5.1;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 65000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 1;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "STRed5#003"
                tst=0.1; tend=7;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 40000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 1;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "STRed5#004"
                tst=4; tend=7;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[15000 40000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 1;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "STRed5#005"
                tst=0.1; tend=7;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[15000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 1;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "STRed5#006"
                tst=0.1; tend=5;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 1;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "ST045#008"
                tst=0.5; tend=8;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 0;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 0;
            case "ST045#009"
                tst=0.1; tend=8;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 0;
            case "ST046#008"
                tst=0.5; tend=8;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 80000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 19;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 1;
            case "ST046#009"
                tst=0.1; tend=5;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 70000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 19;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 1;
            case "ST046#010"
                tst=0.1; tend=5.1;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 0; % no video for this one
                epiglottis_point = 19;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 1;
            case "ST046#011"
                tst=0.1; tend=5.2;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 19;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 1;
            case "ST049#008"
                tst=0.1; tend=8.5;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 19;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 1;
            case "ST049#009"
                tst=8; tend=9;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[15000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 19;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 1;
            case "ST049#010"
                tst=2; tend=8.6;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[15000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 19;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 1;
            case "ST302#006"
                tst=0.5; tend=7;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "ST302#007"
                tst=0.5; tend=7;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 80000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "ST306#008"
                tst=0.5; tend=7;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 65000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 3;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "ST306#009"
                tst=0.2; tend=7;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 70000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 3;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "ST901#013"
                tst=0.1; tend=4;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 0;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "ST901#014"
                tst=0.1; tend=4;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 0;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "ST921#008"
                tst=0.5; tend=4;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 0;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 0;
            case "ST921#009"
                tst=0.1; tend=4;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[40000 100000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 0;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 0;
            case "STRed5#007"
                tst=0.5; tend=2.5;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[40000 80000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 1;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "STRed5#008"
                tst=0.2; tend=2.5;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 1;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "STRed5#009"
                tst=0.4; tend=2.5;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 120000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 1;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "STRed5#010"
                tst=0.3; tend=5;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[1000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 1;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "ST045#010"
                tst=4; tend=6;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[500 40000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 0;
            case "ST045#011"
                tst=4; tend=6;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[500 40000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 0;
            case "ST045#012"
                tst=3.5; tend=6;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[1000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 0;
            case "ST045#013"
                tst=4; tend=6;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 40000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 0;
            case "ST046#012"
                tst=5; tend=8.5;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 19;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 1;
            case "ST049#012"
                tst=3; tend=8;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 19;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 1;
            case "ST049#013"
                tst=0.5; tend=8;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 19;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 1;
            case "ST302#008"
                tst=4; tend=5;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "ST306#011"
                tst=3; tend=5;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[500 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 3;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "ST901#016"
                tst=1; tend=6;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 0;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "ST921#013"
                tst=2; tend=7;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 0;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 0;
                EG4coord = 0;
            case "STRed5#011"
                tst=3; tend=6;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 1;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            case "STRed5#012"
                tst=3; tend=5;% [s] , the interesting part of the data (decide by looking at the raw data) tst = when to start collecting data, tend = when to stop collecting data
                f0range=[10000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;

                fps = 250;
                pre_trigger = 1;
                epiglottis_point = 20;
                AE_point = 15;
                rotated_coords = 1;
                EG4coord = 0;
            otherwise
        end

        % Get trial file
        trial_file = fullfile(treatment_folder,strjoin([trial "mat"],"."));

        % Get DeepLabCut output csv from video analysis
        CSV = better_dir(treatment_folder,"csv");
        CSV = string({CSV.name});
        CSV = CSV(contains(CSV,trial));
        CSV = fullfile(treatment_folder,CSV);
        load(trial_file)
        trigger_data = data(:,end); % some data files have 4 columns and some 5, but trigger data is always in the last one
        % sampling frequency
        FsAi = 1/(Time(2)-Time(1));

        % filter sound data
        Wn     =   [highPass]/(FsAi/2);
        [B,A]  =   butter(5,Wn,'high');
        SI1    =   filtfilt(B, A, SI1);

        clear p
        p.minf0 = f0range(1);			% Hz - minimum frequency
        p.maxf0 = f0range(2);			% Hz - maximum frequency
        p.hop = FrBinwidth;			% samples - interval between estimates
        p.sr=FsAi;				    % sampling rate
        % yin for frequency detection
        R=yin(SI1,p);

        Ind_good=find(R.ap0<APthreshold);
        Ind_power=find(R.pwr>PWRthreshold);
        Ind_allcrit=find(R.pwr>PWRthreshold & R.ap0<APthreshold);

        nframes=size(R.f0,2)
        fsr=p.sr/p.hop;
        t_yin=(1:nframes)/fsr;

        figure; tl=tiledlayout(4,1);

        % Plot YIN estimates
        top = nexttile
        plot(t_yin, R.f0, 'k.',     t_yin(Ind_allcrit), R.f0(Ind_allcrit), '.g');
        ylabel('Sound f0 (Hz)')
        mid = nexttile
        plot(t_yin, R.ap0, 'k.',    t_yin(Ind_good), R.ap0(Ind_good), 'y.')
        ylabel('Sound Aperiodicity')
        bot = nexttile
        plot(t_yin, R.pwr, 'k.',    t_yin(Ind_power), R.pwr(Ind_power), 'y.');
        ylabel('Sound Power')
        linkaxes([top mid bot], 'x');
        xlabel("time(s)")
        title(tl,trial)

        % Plot sound and movement and flow
        % process DLC output
        if isempty(strfind(CSV,'.csv')) % if there is no video
            % plot everything without video data
            figure; t2 = tiledlayout(5,1);
            f0 = nexttile; title(trial)
            % plot spectrogram
            nfft= 1024*1;
            w   = window(@flattopwin,nfft);
            [Sp,F,T,P] = spectrogram(SI1,w, round(.0*nfft),nfft, FsAi);

            surf(T,F,10*log10(abs(P)),'EdgeColor','none');
            hold on
            view(2)
            scatter(t_yin, R.f0, 1, 'r','filled','MarkerFaceAlpha',0.25);
            plot(t_yin(Ind_allcrit), R.f0(Ind_allcrit), 'r.', 'LineWidth',2);

            % calculate Shannon's Entropy to detect frequency
            ntotake1 = find(F>min_frequency&F<max_frequency);
            newP = P(ntotake1,:)./sum(P(ntotake1,:));
            ShannonsEntropy = -1./log2(size(newP,2))*sum(newP.*log2(newP));
            ShannonsEntropy_mean = movmean(ShannonsEntropy, 6);
            [~, USV_index] = find(ShannonsEntropy_mean < min_ShannonsEntropy);
            [~, ConNumbers_index] = find(diff(USV_index) <= 1);
            ConNumbers_index = USV_index(ConNumbers_index);
            [~, break_index] = find(diff(ConNumbers_index) > 1);

            last_j = 1;
            startTimes = [];
            endTimes = [];
            extFreq = [];
            for j = [break_index length(ConNumbers_index)]

                [~, T_min_index] = min(abs(T - T(ConNumbers_index(last_j)-1)));
                [~, T_max_index] = min(abs(T - T(ConNumbers_index(j)+1)));

                startTimes = [startTimes, T(T_min_index)];
                endTimes = [endTimes, T(T_max_index)];

                maskedP = P;
                maskedP((F < min_frequency | F > max_frequency),:) = 0;
                maskedP(:,[1:T_min_index T_max_index:end]) = 0;

                [extractedFrequency,~,~] = tfridge(maskedP,F,0.001);
                exf = extractedFrequency(T_min_index:T_max_index);
                extFreq = [extFreq; exf];

                plot(T(T_min_index:T_max_index),extractedFrequency(T_min_index:T_max_index),'LineWidth',1.5,'Color','black');
                
                last_j = j+1;
            end

            ylabel('frequency (Hz)')
            xlabel("time(s)")

            % air flow data
            rawFlow = data(:,2);
            % filter the air flow data to depict as ml/s
            flowFiltered = filter_signal(rawFlow, 1/(Time(2)-Time(1)), sort([(100:100:700)+0.2 (50:100:1550)-0.1]));
            flow_ml = ((flowFiltered-1)/(5-1))*flow_fullscale/60*1e-6;

            % plot air flow
            f1=nexttile;
            plot(Time, flow_ml * 1e6, 'Linewidth', 2, 'Color', 'k');
            ylabel('Flow (ml/s)');

            % filter sound pressure and plot
            f2=nexttile; hold on;
            filteredSound = SI1 - mean(SI1);
            rmsOfAmplitude = rms_Ajiboye(filteredSound, 4800, 240, 0);
            rmsTime = linspace(Time(1), Time(end), numel(rmsOfAmplitude));
            plot(Time,filteredSound*1e3, 'Color', [.5 .5 .5]);
            set(gca,'XTickLabel',[])
            ylabel('Sound pressure (mPa)')

            meansound = plot(rmsTime, rmsOfAmplitude*1e3, 'Linewidth', 2, 'Color', 'k');
            legend(meansound, 'rms')

            f3=nexttile; hold on;
            % plot subglottal air pressure in kPA
            plot(Time,PI2, 'Linewidth', 2, 'Color', 'k');
            set(gca,'XTickLabel',[])
            ylabel('Subglottal pressure (kPa)')

            f4=nexttile; hold on;
            % plot Shannon's Entropy to see where detects sound
            plot(T,ShannonsEntropy)
            plot(T,ShannonsEntropy_mean)
            ylabel('log2(Shannon''s entropy)')
            xlabel('Time (s)')
            linkaxes([f0, f1, f2, f3, f4], 'x')
            
        else % there is a video
            % some videos needed to be rotated
            if rotated_coords == 1
                % pull x y coordinates from DLC output file
                xy = getXYfromDLC_rotcoord_sks(CSV);
            else
                xy = getXYfromDLC(CSV);
            end
            % time
            video_time = 0-pre_trigger/fps:1/fps:(size(xy,1)-1-pre_trigger)/fps;

            % at what point video started recording
            trigger_time = Time(find(trigger_data>1,1,'first'));
            % time adjusted for trigger
            video_time = video_time + trigger_time;

            % filter out artificial oscillations
            for point_number=1:size(xy,2)
                xy(:,point_number, 2) = tybutterNaN(xy(:,point_number, 2), 10, fps, 'low');
                xy(:,point_number, 1) = tybutterNaN(xy(:,point_number, 1), 10, fps, 'low');
            end
            % 046 and 049 had only four landmarks for EG, so find midpoint
            % between coordinate 19 and 20 for these
            % plot epiglottal landmark
            if EG4coord == 1
                midpoint_y = [];
                for pt=1:size(xy,1)
                    midpoint_y = [midpoint_y, (xy(pt,epiglottis_point,2)+xy(pt,epiglottis_point+1,2))/2];
                end
                figure; t2 = tiledlayout(7,1);
                f0 = nexttile;
                plot(video_time,midpoint_y);
                ylabel("EG position (px)")
            else
                figure; t2 = tiledlayout(7,1);
                f0 = nexttile;
                plot(video_time,xy(:,epiglottis_point,2));
                ylabel("EG position (px)")
            end
            
            % plot alar edge landmark
            f1=nexttile;
            plot(video_time,xy(:,AE_point,2));
            ylabel("AE position (px)")
            
            % all below is the same code as in the "no video" case above
            f2=nexttile; hold on; title(trial)
            nfft= 1024*1;
            w   = window(@flattopwin,nfft);
            [Sp,F,T,P] = spectrogram(SI1,w, round(.0*nfft),nfft, FsAi);

            surf(T,F,10*log10(abs(P)),'EdgeColor','none');
            hold on
            view(2)
            scatter(t_yin, R.f0, 1, 'r','filled','MarkerFaceAlpha',0.25);
            plot(t_yin(Ind_allcrit), R.f0(Ind_allcrit), 'r.', 'LineWidth',2);

            ntotake1 = find(F>min_frequency&F<max_frequency);
            newP = P(ntotake1,:)./sum(P(ntotake1,:));
            ShannonsEntropy = -1./log2(size(newP,2))*sum(newP.*log2(newP));
            ShannonsEntropy_mean = movmean(ShannonsEntropy, 6);
            [~, USV_index] = find(ShannonsEntropy_mean < min_ShannonsEntropy);
            [~, ConNumbers_index] = find(diff(USV_index) <= 1);
            ConNumbers_index = USV_index(ConNumbers_index);
            [~, break_index] = find(diff(ConNumbers_index) > 1);
            last_j = 1;
            startTimes = [];
            endTimes = [];
            extFreq = [];
            for j = [break_index length(ConNumbers_index)]

                [~, T_min_index] = min(abs(T - T(ConNumbers_index(last_j)-1)));
                [~, T_max_index] = min(abs(T - T(ConNumbers_index(j)+1)));

                startTimes = [startTimes, T(T_min_index)];
                endTimes = [endTimes, T(T_max_index)];
                
                maskedP = P;
                maskedP((F < min_frequency | F > max_frequency),:) = 0;
                maskedP(:,[1:T_min_index T_max_index:end]) = 0;

                [extractedFrequency,~,~] = tfridge(maskedP,F,0.001);
                exf = extractedFrequency(T_min_index:T_max_index);
                extFreq = [extFreq; exf];

                plot(T(T_min_index:T_max_index),extractedFrequency(T_min_index:T_max_index),'LineWidth',1.5,'Color','black');
                last_j = j+1;
            end

            ylabel('frequency (Hz)')
            xlabel("time(s)")

            rawFlow = data(:,2);
            flowFiltered = filter_signal(rawFlow, 1/(Time(2)-Time(1)), sort([(100:100:700)+0.2 (50:100:1550)-0.1]));
            flow_ml = ((flowFiltered-1)/(5-1))*flow_fullscale/60*1e-6;

            f3=nexttile;
            plot(Time, flow_ml * 1e6, 'Linewidth', 2, 'Color', 'k');
            ylabel('Flow (ml/s)');

            f4=nexttile; hold on;
            filteredSound = SI1 - mean(SI1);
            rmsOfAmplitude = rms_Ajiboye(filteredSound, 4800, 240, 0);
            rmsTime = linspace(Time(1), Time(end), numel(rmsOfAmplitude));
            plot(Time,filteredSound*1e3, 'Color', [.5 .5 .5]);
            set(gca,'XTickLabel',[])
            ylabel('Sound pressure (mPa)')

            meansound = plot(rmsTime, rmsOfAmplitude*1e3, 'Linewidth', 2, 'Color', 'k');
            legend(meansound, 'rms')

            f5=nexttile; hold on;
            plot(Time,PI2, 'Linewidth', 2, 'Color', 'k');
            set(gca,'XTickLabel',[])
            ylabel('Subglottal pressure (kPa)')

            f6=nexttile; hold on;
            plot(T,ShannonsEntropy)
            plot(T,ShannonsEntropy_mean)
            ylabel('log2(Shannon''s entropy)')
            xlabel('Time (s)')
            linkaxes([f0, f1, f2, f3, f4, f5, f6], 'x')
        end

        % put filtered sound pressure --> array
        sp_array = [sp_array; filteredSound];
        % initialize empty array of same size as filtered sound array
        sp_on_according_to_entropy_TEMP = nan(size(filteredSound));
        time_buffer = 0.05; % to avoid edge effects
        % look only at data where we detect sound
        for time_i = 1:numel(startTimes)
            % look at window with chunk of sound in it
            startTime = startTimes(time_i); 
            endTime = endTimes(time_i);
            % assign all samples within sound window to 1
            sp_on_according_to_entropy_TEMP(Time > startTime + time_buffer & Time < endTime - time_buffer) = 1;
        end
        % assign table of 1s and NaNs to new file
        sp_on_according_to_entropy = [sp_on_according_to_entropy; sp_on_according_to_entropy_TEMP];
        sp_on_according_to_yin_TEMP = nan(size(filteredSound)); % Not using yet, maybe never. I am not sure which criteria we use to determine if USV is going on or not

        % calculate RMS of filtered sound
        filteredSound_rms = sqrt(movmean(filteredSound.^2 , rms_window_length));
        % calculate sound dB correcting for mic distance
        filteredSound_db = 20 * log10(filteredSound_rms / 20e-6) + 20*log10(mic_distance/1);
        % add to an array 
        sp_array_db = [sp_array_db; filteredSound_db];
        sp_array_kPa = [sp_array_kPa; PI2];
        % length of filtered sound 
        num_detected = length(filteredSound);

        % what is the larynx id
        parts = split(trial, "#");
        individual = parts{1}; % The part before "#"

        sp_trial_name = [sp_trial_name; repmat(trial, num_detected, 1)]; % Repeat trial name
        sp_individual = [sp_individual; repmat(individual, num_detected, 1)]; % Repeat individual
    end
end

if EG4coord == 1
    vidEG = midpoint_y;
else
   vidEG = xy(:,epiglottis_point,2); 
end

vidAE = xy(:,AE_point,2);

% if you want to upsample video data to match audio
[~, newtime] = resample(vidAE,video_time, FsAi);
vidAE_resample = interp1(video_time,vidAE,newtime, "spline");
vidEG_resample = interp1(video_time,vidEG,newtime, "spline");
%vidAE_resample = tybutterNaN(vidAE_resample, 20, FsAi, 'low');
%vidtime_resample = resample(video_time,200000,250);
% vidtime_resample = video_time(1):1/FsAi:video_time(end);
% plot(vidtime_resample,vidAE_resample(1:numel(vidtime_resample)))
% hold on
% plot(video_time,vidAE, 'x')
figure
plot(newtime,vidAE_resample)
hold on
plot(video_time,vidAE, 'x')

% if you want to downsample audio (entropy) data to match video
entropyTime = [];
for i = 1:length(startTimes)
    s_index = find(T == startTimes(i));
    e_index = find(T == endTimes(i));
    entropyTime = [entropyTime, T(s_index:e_index)];
end
entropyF0 = extFreq';

[~, newtime] = resample(entropyF0,entropyTime, fps);
ent_resample = interp1(entropyTime,entropyF0,newtime, "spline");
figure
plot(newtime,ent_resample)
hold on
plot(entropyTime,entropyF0, 'x')

ds_entropy = [newtime(:),ent_resample(:)];

% location where you want to save outfile
outfileent = "";
writematrix(ds_entropy,outfileent);

%%
figure
% Create a table from your data
T = table(sp_array_db.* sp_on_according_to_entropy, sp_array_kPa.* sp_on_according_to_entropy,...
    sp_trial_name, sp_individual, ...
          'VariableNames', {'SPL_dB', 'subglottal_pressure_kPa','Trial', 'Individual'});

bc = boxchart(categorical(T.Trial), T.SPL_dB, 'GroupByColor', categorical(T.Trial))

% 📌 Beautify Plot
xlabel('Trial Name', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('SPL (dB)', 'FontSize', 12, 'FontWeight', 'bold');
title('SPL Distribution Across Trials', 'FontSize', 14, 'FontWeight', 'bold');

% 📌 Rotate labels for better readability
xtickangle(45);

% 📌 Improve grid visibility
grid on;
ax = gca;
ax.GridLineStyle = '--'; 
ax.GridAlpha = 0.3; % Subtle grid

% 📌 Increase font size for clarity
ax.FontSize = 12;

hold off;

% location where you want to save sound pressure output data
outfileSP = "";
writetable(T,outfileSP);