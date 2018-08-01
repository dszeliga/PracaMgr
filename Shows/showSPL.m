function [] = showSPL(signal, segment, Fs)

%figure();
%Poziom ciœnienia akustycznego
for i = 1:length(signal)
    
    if exist('segment', 'var')
        if isstruct(signal{i}) && ~isempty(segment)
            sound =  signal{1, i}.Segment{segment};
        else
            sound = signal{i};
        end
    else
        sound = signal;
    end
    
    % [ramki, indeksy dzwieku]=[dzwiek, wielkosc ramki, przesuniecie, 'cols' lub 'rows', okno,
    % ostatnie uzupe³niæ czy odci¹æ (0,1)]
    Tw = 20;           % analysis frame duration (ms)
    Ts = 10;           % analysis frame shift (ms)
    
    Nw = round( 1E-3*Tw*Fs );    % frame duration (samples)
    Ns = round( 1E-3*Ts*Fs );    % frame shift (samples)
    [frames, indexes] = vec2frames(sound, Nw, Ns, 'cols', @hamming, 0);
    t = cumsum(ones(size(sound))/Fs);
    
    %SPL = spl(sound,'air',0.01,Fs);
    
    for j= 1:size(frames,2)
        sound= frames(:,j);
        pxx = pmtm(sound);
        Pxx{j} = pxx;
        SPL = spl(sound,'air',0.001, Fs);
        
        t=ChangeSamplesToTime(sound, Fs);
        N=length(sound);
        
        %f=0:Fs/(N-1):Fs/2;
        f=-Fs/2:Fs/(N-1):Fs/2;
        
        z=fftshift(fft(sound));
        
        %https://www.mathworks.com/matlabcentral/answers/15770-scaling-the-fft-and-the-ifft
        
        
    
        magnitude = sqrt(real(z).^2+imag(z).^2);
        magnitude = 10*log10(magnitude);
        
        
        %[pressure, freq] = pmtm(sound,2,length(sound),Fs,'centered');
        %wyœwietlenie
        subplot(2,2,1)
        plot(f, abs(z));
        title('Sound pressure level - fft');
        ylabel('Amplitude');
        xlabel('Frequenzy [Hz]');
        xlim([0 Fs/2]);
        hold on;
        
        subplot(2,2,2)
        plot(f, magnitude);
        axis tight;
        title('Sound pressure level to db');
        ylabel('Sound pressure level (dB)');
        ylim([0 (max(magnitude)+10)]);
        xlim([0 Fs/2]);
        xlabel('Frequenzy [Hz]');
        hold on;
        
        subplot(2,2,3)
        plot(t, SPL)
        axis tight
        title('Sound pressure level');
        ylabel('Sound pressure level (dB)');
        xlabel('time [s]');
        hold on;
        
       
                pxx = pmtm(sound,1.5,length(sound),Fs,'centered');
                axis tight
                title('Sound pressure level');
                ylabel('Sound pressure level (dB)');
                xlabel('Frequenzy [Hz]');
                hold on;     
        
    end
    
     subplot(2,2,4)
          a = cell2mat(Pxx);
        plot(mean(a));
        hold on; 
        plot(mean(a)-std(a),'--r'); 
        plot(mean(a)+std(a),'--r');
    %a = cell2mat(Pxx);figure,plot(mean(a));hold on; plot(median(a)-quantile(a,.25),'--r'); plot(mean(a)+quantile(a,.75),'--r')
    if ~exist('segment', 'var')
        break;
    end
end
hold off;
end

