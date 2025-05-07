function filtered_signal = filter_signal(signal, acquisition_rate, noise_frequencies)
    L = length(signal);
    f = acquisition_rate*(0:(L/2))/L;
    
    peaks = [];

    for i = noise_frequencies
        [~, index] = min(abs(f-i));
        peaks(end+1) = index;
    end
    
    filtered_signal = signal;
    
    width = 25;
    
    for i=1:5
        filtered_signal = fft(abs(filtered_signal));
        for j = peaks
            filtered_signal(j-width:j+width) = 0;
        end
        filtered_signal = ifft(filtered_signal);
    end
    
    filtered_signal = abs(filtered_signal);
    
    %Time = (0:(length(signal)-1))*1/acquisition_rate;
    
%     figure(666); hold on; cla;
%     plot(Time, signal, 'b');
%     plot(Time, filtered_signal, 'r');