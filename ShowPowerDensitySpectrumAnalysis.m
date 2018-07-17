function[] = ShowPowerDensitySpectrumAnalysis(sound, segment)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Funkcja g�sto�ci widmowej mocy (PSD) pokazuje si�� zmian (energii)
% w funkcji cz�stotliwo�ci. Innymi s�owy, pokazuje, przy kt�rych wahaniach
% cz�stotliwo�ci s� silne i przy kt�rych wahania cz�stotliwo�ci s� s�abe.
% Jednostk� PSD jest energia na cz�stotliwo�� (szeroko��) (dB/Hz) i mo�na uzyska�
% energi� w okre�lonym zakresie cz�stotliwo�ci poprzez integracj� PSD w tym
% zakresie cz�stotliwo�ci. Obliczanie PSD odbywa si� bezpo�rednio za
% pomoc� metody zwanej FFT lub funkcji autokorelacji obliczeniowej,
% a nast�pnie jej transformacji.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Analiza widma gestosci mocy
for i = 1:length(sound)
    periodogramSound = periodogram(sound{1, i}.Segment{segment});%uzywa okna prostok�tnego
    periodogramSound = periodogramSound./max(periodogramSound);
    plot(periodogramSound);
    title('Power Density Spectrum')
    hold on;
    xlabel('Frequenzy [Hz]');
    ylabel('Power density spectrum [dB]');
end
hold off;
end

