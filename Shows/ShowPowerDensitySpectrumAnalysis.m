function[] = ShowPowerDensitySpectrumAnalysis(sound, segment)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Funkcja gêstoœci widmowej mocy (PSD) pokazuje si³ê zmian (energii)
% w funkcji czêstotliwoœci. Innymi s³owy, pokazuje, przy których wahaniach
% czêstotliwoœci s¹ silne i przy których wahania czêstotliwoœci s¹ s³abe.
% Jednostk¹ PSD jest energia na czêstotliwoœæ (szerokoœæ) (dB/Hz) i mo¿na uzyskaæ
% energiê w okreœlonym zakresie czêstotliwoœci poprzez integracjê PSD w tym
% zakresie czêstotliwoœci. Obliczanie PSD odbywa siê bezpoœrednio za
% pomoc¹ metody zwanej FFT lub funkcji autokorelacji obliczeniowej,
% a nastêpnie jej transformacji.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Analiza widma gestosci mocy
for i = 1:length(sound)
    periodogramSound = periodogram(sound{1, i}.Segment{segment});%uzywa okna prostok¹tnego
    periodogramSound = periodogramSound./max(periodogramSound);
    plot(periodogramSound);
    title('Power Density Spectrum')
    hold on;
    xlabel('Frequenzy [Hz]');
    ylabel('Power density spectrum [dB]');
end
hold off;
end

