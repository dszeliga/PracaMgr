function [] = showSPL(signal, segment, Fs)

%Poziom ci�nienia akustycznego
for i = 1:length(signal)    
    t = cumsum(ones(size(signal{1, i}.Segment{segment}))/Fs);
    SPL = spl(signal{1, i}.Segment{segment},'air',0.01,Fs);
    SPL=abs(fft(SPL));   
    plot(SPL(10:end,1));
    axis tight
    title('Sound pressure level');
    ylabel('Sound pressure level (dB)');
    xlabel('Frequenzy [Hz]');
    hold on;    
end
hold off;
end

