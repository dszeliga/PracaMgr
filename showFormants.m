function [] = showFormants( signal, segment, Fs )
formants = LPCAnalyse(signal,segment, Fs);
hold on;
plot(formants, '.k');
hold off;
end

