% Define general signal processing parameters
highPass = 2500;
lowPass = 990000;
FrBinwidth=10;
min_ShannonsEntropy = 0.4;

min_frequency = 15000;
max_frequency = 90000;

% Define folder master folder
master_folder = "/Users/SSmith/Library/CloudStorage/Box-Box/Phelps Lab Server/Projects/SKS/sks_scte_sound_prod_mech/larynx_manipulation/Data/S. teguina/Analysis exp2";

% Define treatment folders
treatment_folders = ["01_custom_step",...
   "02_custom_step_mirror",...
   "03_alternating_pressure",...
   "04_alar_cut"];

% Define list of trials
trials{1} = ["ST310#005","STFem003#006","STFem003#008","STFem003#009",...
    "STRed9#001","STRed7#002","STRed10#005"];
trials{2} = [];
trials{3} = [];
trials{4} = [];

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
for treatment = 1%1:5
    treatment_folder = fullfile(master_folder,treatment_folders(treatment));
    % Loop over trials
    for trial_number = 1:numel(trials{treatment})
        trial = trials{treatment}(trial_number);
        switch trial
            case "ST310#005"
                tst=0; tend=9.5;
                f0range=[10000 40000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 2;
                epiglottis_point = 18;
                AE_point = 13;
            case "STFem003#006"
                tst=0; tend=7.5;
                f0range=[30000 80000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 18;
                AE_point = 13;
            case "STFem003#007"
                tst=1; tend=8;
                f0range=[20000 80000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 18;
                AE_point = 13;
            case "STFem003#008"
                tst=0.5; tend=8.5;
                f0range=[20000 80000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 18;
                AE_point = 13;
            case "STFem003#009"
                tst=2.5; tend=8;
                f0range=[20000 75000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 18;
                AE_point = 13;
            case "STFem891#000"
                tst=1; tend=7.5;
                f0range=[10000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 18;
                AE_point = 13;
            case "STFem891#001"
                tst=0; tend=7.5;
                f0range=[20000 50000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 18;
                AE_point = 13;
            case "STFem891#002"
                tst=1.5; tend=6;
                f0range=[20000 50000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 18;
                AE_point = 13;
            case "STFem891#004"
                tst=0; tend=6;
                f0range=[10000 50000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 18;
                AE_point = 13;
            case "STRed7#002"
                tst=0; tend=6.5;
                f0range=[40000 80000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 18;
                AE_point = 13;
            case "STRed9#001"
                tst=0; tend=8.5;
                f0range=[10000 40000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 0;
                epiglottis_point = 18;
                AE_point = 13;
            case "STRed10#005"
                tst=0; tend=8.5;
                f0range=[30000 80000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 18;
                AE_point = 13;
            case "ST310#006"
                tst=0; tend=9;
                f0range=[10000 40000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 2;
                epiglottis_point = 18;
                AE_point = 13;
            case "STFem891#005"
                tst=2; tend=5.5;
                f0range=[10000 30000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 18;
                AE_point = 13;
            case "STRed7#003"
                tst=0; tend=6.5;
                f0range=[40000 80000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 18;
                AE_point = 13;
            case "ST310#007"
                tst=0; tend=3;
                f0range=[20000 50000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 2;
                epiglottis_point = 18;
                AE_point = 13;
            case "ST310#008"
                tst=0; tend=3.5;
                f0range=[10000 40000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 2;
                epiglottis_point = 18;
                AE_point = 13;
            case "ST310#009"
                tst=0; tend=5;
                f0range=[10000 40000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 2;
                epiglottis_point = 18;
                AE_point = 13;
            case "STFem891#006"
                tst=0; tend=3;
                f0range=[20000 60000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 18;
                AE_point = 13;
            case "STFem891#010"
                tst=0; tend=5;
                f0range=[10000 70000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 18;
                AE_point = 13;
            case "STRed9#003"
                tst=0; tend=3;
                f0range=[10000 40000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 18;
                AE_point = 13;
            case "STRed9#004"
                tst=0; tend=3.5;
                f0range=[20000 40000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 18;
                AE_point = 13;
            case "STRed9#005"
                tst=0; tend=5;
                f0range=[10000 30000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 18;
                AE_point = 13;
            case "STRed10#006"
                tst=0; tend=3;
                f0range=[40000 80000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 18;
                AE_point = 13;
            case "STRed10#007"
                tst=0; tend=3.5;
                f0range=[30000 80000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 18;
                AE_point = 13;
            case "STRed10#008"
                tst=0; tend=5;
                f0range=[30000 80000];
                PWRthreshold = 0.085;
                APthreshold = 1;
                
                fps = 250;
                pre_trigger = 250;
                epiglottis_point = 18;
                AE_point = 13;
            otherwise
        end

        % Get trial file
        trial_file = fullfile(treatment_folder,strjoin([trial "mat"],"."));

        % Get DLC output csv
        CSV = better_dir(treatment_folder,"csv");
        CSV = string({CSV.name});
        CSV = CSV(contains(CSV,trial));
        CSV = fullfile(treatment_folder,CSV);
        load(trial_file)
        trigger_data = data(:,end); % some data files have 4 columns and some 5, but trigger data seems to always be in the last one
        FsAi = 1/(Time(2)-Time(1));

        Wn     =   [highPass]/(FsAi/2);
        [B,A]  =   butter(5,Wn,'high');
        SI1    =   filtfilt(B, A, SI1);

        clear p
        p.minf0 = f0range(1);			% Hz - minimum frequency
        p.maxf0 = f0range(2);			% Hz - maximum frequency
        p.hop = FrBinwidth;			% samples - interval between estimates
        p.sr=FsAi;				    % sampling rate
        %R=yin(SI1,p);

        %Ind_good=find(R.ap0<APthreshold);
        %Ind_power=find(R.pwr>PWRthreshold);
        %Ind_allcrit=find(R.pwr>PWRthreshold & R.ap0<APthreshold);

        %nframes=size(R.f0,2)
        %fsr=p.sr/p.hop;
        %t_yin=(1:nframes)/fsr;

        %figure; tl=tiledlayout(4,1);

        % Plot YIN estimates
        %top = nexttile
        %plot(t_yin, R.f0, 'k.',     t_yin(Ind_allcrit), R.f0(Ind_allcrit), '.g');
        %ylabel('Sound f0 (Hz)')
        %mid = nexttile
        %plot(t_yin, R.ap0, 'k.',    t_yin(Ind_good), R.ap0(Ind_good), 'y.')
        %ylabel('Sound Aperiodicity')
        %bot = nexttile
        %plot(t_yin, R.pwr, 'k.',    t_yin(Ind_power), R.pwr(Ind_power), 'y.');
        %ylabel('Sound Power')
        %linkaxes([top mid bot], 'x');
        %xlabel("time(s)")
        %title(tl,trial)

        % Plot sound and movement and flow and so on
        % process DLC output
        if isempty(strfind(CSV,'.csv')) % if there is no video
            % plot everything without video data
            figure; t2 = tiledlayout(6,1);
            f0 = nexttile; title(trial)
            nfft= 1024*1;
            w   = window(@flattopwin,nfft);
            [Sp,F,T,P] = spectrogram(SI1,w, round(.0*nfft),nfft, FsAi);

            surf(T,F,10*log10(abs(P)),'EdgeColor','none');
            hold on
            view(2)
            %scatter(t_yin, R.f0, 1, 'r','filled','MarkerFaceAlpha',0.25);
            %plot(t_yin(Ind_allcrit), R.f0(Ind_allcrit), 'r.', 'LineWidth',2);

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
                %disp(rmsTime(ConNumbers_index(last_i:i)));

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

            f1=nexttile;
            plot(Time, flow_ml * 1e6, 'Linewidth', 2, 'Color', 'k');
            ylabel('Flow (ml/s)');

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
            plot(Time,PI2, 'Linewidth', 2, 'Color', 'k');
            set(gca,'XTickLabel',[])
            ylabel('Subglottal pressure (kPa)')

            f4=nexttile; hold on;
            plot(Time,data(:,5),'Linewidth',2,'Color','k');
            set(gca,'XTickLabel',[])
            ylabel('Servo Action')
            
            f5=nexttile; hold on;
            plot(T,ShannonsEntropy)
            plot(T,ShannonsEntropy_mean)
            ylabel('log2(Shannon''s entropy)')
            xlabel('Time (s)')
            linkaxes([f0, f1, f2, f3, f4], 'x')
            
        else % there is a video
            % process video data and plot everything
            xy = getXYfromDLC_exp2(CSV);
            video_time = 0-pre_trigger/fps:1/fps:(size(xy,1)-1-pre_trigger)/fps;

            trigger_time = Time(find(trigger_data>1,1,'first'));
            video_time = video_time + trigger_time;

            % filter out artificial oscillations
            for point_number=1:size(xy,2)
                xy(:,point_number, 2, 2) = tybutterNaN(xy(:,point_number, 2, 2), 10, fps, 'low');
                xy(:,point_number, 1, 2) = tybutterNaN(xy(:,point_number, 1, 2), 10, fps, 'low');
            end
            
            % calculate estimated glottal area
            GA = [];
            for ar=1:size(xy,1)
                temp = [xy(ar,1:10,1,2);xy(ar,1:10,2,2)]';
                [~,A] = boundary(temp);
                GA = [GA,A];
            end
            
            % plot thyroid landmark position
            figure; t2 = tiledlayout(4,1);
            f0 = nexttile;
            plot(video_time,xy(:,23,2, 2));
            ylabel("Thyroid position (px)")
            
            f1=nexttile; hold on; title(trial)
            nfft= 1024*1;
            w   = window(@flattopwin,nfft);
            [Sp,F,T,P] = spectrogram(SI1,w, round(.0*nfft),nfft, FsAi);

            surf(T,F,10*log10(abs(P)),'EdgeColor','none');
            hold on
            view(2)
            %scatter(t_yin, R.f0, 1, 'r','filled','MarkerFaceAlpha',0.25);
            %plot(t_yin(Ind_allcrit), R.f0(Ind_allcrit), 'r.', 'LineWidth',2);

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
                %disp(rmsTime(ConNumbers_index(last_i:i)));

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

            f2=nexttile;
            plot(Time, flow_ml * 1e6, 'Linewidth', 2, 'Color', 'k');
            ylabel('Flow (ml/s)');

            f3=nexttile; hold on;
            filteredSound = SI1 - mean(SI1);
            rmsOfAmplitude = rms_Ajiboye(filteredSound, 4800, 240, 0);
            rmsTime = linspace(Time(1), Time(end), numel(rmsOfAmplitude));
            plot(Time,filteredSound*1e3, 'Color', [.5 .5 .5]);
            set(gca,'XTickLabel',[])
            xlabel('Time (s)')
            ylabel('Sound pressure (mPa)')
            linkaxes([f0, f1, f2, f3], 'x')
            
            figure; t3 = tiledlayout(6,1);
            f0=nexttile; hold on; title(trial)
            nfft= 1024*1;
            w   = window(@flattopwin,nfft);
            [Sp,F,T,P] = spectrogram(SI1,w, round(.0*nfft),nfft, FsAi);

            surf(T,F,10*log10(abs(P)),'EdgeColor','none');
            hold on
            view(2)
            %scatter(t_yin, R.f0, 1, 'r','filled','MarkerFaceAlpha',0.25);
            %plot(t_yin(Ind_allcrit), R.f0(Ind_allcrit), 'r.', 'LineWidth',2);

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
            for j = [break_index length(ConNumbers_index)]

                [~, T_min_index] = min(abs(T - T(ConNumbers_index(last_j)-1)));
                [~, T_max_index] = min(abs(T - T(ConNumbers_index(j)+1)));

                startTimes = [startTimes, T(T_min_index)];
                endTimes = [endTimes, T(T_max_index)];
                
                maskedP = P;
                maskedP((F < min_frequency | F > max_frequency),:) = 0;
                maskedP(:,[1:T_min_index T_max_index:end]) = 0;

                [extractedFrequency,~,~] = tfridge(maskedP,F,0.001);

                plot(T(T_min_index:T_max_index),extractedFrequency(T_min_index:T_max_index),'LineWidth',1.5,'Color','black');
                last_j = j+1;
            end

            ylabel('frequency (Hz)')
            xlabel("time(s)")
            
            rawFlow = data(:,2);
            flowFiltered = filter_signal(rawFlow, 1/(Time(2)-Time(1)), sort([(100:100:700)+0.2 (50:100:1550)-0.1]));
            flow_ml = ((flowFiltered-1)/(5-1))*flow_fullscale/60*1e-6;

            f1=nexttile;
            plot(Time, flow_ml * 1e6, 'Linewidth', 2, 'Color', 'k');
            ylabel('Flow (ml/s)');
           
            f2=nexttile; hold on;
            plot(Time,PI2, 'Linewidth', 2, 'Color', 'k');
            set(gca,'XTickLabel',[])
            ylabel('Subglottal pressure (kPa)')
            
            f3=nexttile; hold on;
            plot(Time,data(:,5),'Linewidth',2,'Color', 'k');
            set(gca,'XTickLabel',[])
            ylabel('Servo Action')
            
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
            plot(T,ShannonsEntropy)
            plot(T,ShannonsEntropy_mean)
            ylabel('log2(Shannon''s entropy)')
            xlabel('Time (s)')
            linkaxes([f0, f1, f2, f3, f4, f5], 'x')
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

vidEG = xy(:,epiglottis_point,2,2);
vidAE = xy(:,AE_point,2,2);
vidTh = xy(:,23,2,2);

% if you want to upsample video data to match audio
[~, newtime] = resample(vidAE,video_time, FsAi);
vidAE_resample = interp1(video_time,vidAE,newtime, "spline");
vidEG_resample = interp1(video_time,vidEG,newtime, "spline");
GA_resample = interp1(video_time,GA,newtime,"spline");
vidTh_resample = interp1(video_time,vidTh,newtime,"spline");
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

outfileent = "";
writematrix(ds_entropy,outfileent);

% downsampling flow
[~, newflowtime] = resample(flow_ml,Time,fps);
flow_resample = interp1(Time,flow_ml,newflowtime,"spline");
figure
plot(newflowtime,flow_resample)
hold on
plot(Time, flow_ml, 'x')

ds_flow = [newflowtime(:),flow_resample(:)];

outfileflow = "";
writematrix(ds_flow,outfileflow);

% downsampling air pressure
[~, newprestime] = resample(PI2,Time,fps);
p_resample = interp1(Time,PI2,newprestime,"spline");

ds_pres = [newprestime(:),p_resample(:)];

outfilepres = "";
writematrix(ds_pres,outfilepres);

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

outfileSP = "";
writetable(T,outfileSP);