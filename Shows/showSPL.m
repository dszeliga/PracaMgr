function [] = showSPL(signal, segment, Fs)

%Poziom ciœnienia akustycznego
for i = 1:length(signal)    
    t = cumsum(ones(size(signal{1, i}.Segment{segment}))/Fs);
    SPL = spl(signal{1, i}.Segment{segment},'air',0.01,Fs);
    %SPL=abs(fft(SPL));   
    plot(t, SPL);
    axis tight
    title('Sound pressure level');
    ylabel('Sound pressure level (dB)');
    %xlabel('Frequenzy [Hz]');
    xlabel('time [s]');
    hold on;    
end
hold off;
end

