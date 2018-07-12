function[] = ShowPowerDensitySpectrumAnalysis(sound, segment, func)
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
    %for j=1:length(sound{1,1}.Segment)
    
    switch(func)
        case 'periodogram'
            periodogramSound = periodogram(sound{1, i}.Segment{segment});%uzywa okna prostok�tnego
            plot(periodogramSound(200:end));
            title('Power Density Spectrum(periodogram)')
            hold on;
        case 'pwelch'
            pwelchSound = pwelch(sound{1, i}.Segment{segment});%nak�ada segment Welcha u�redniaj�cy estymator
            plot(pwelchSound(100:end));
            title('Power Density Spectrum(pwelch)')
            hold on;
        case 'pcov'
            pcovSound = pcov(sound{1, i}.Segment{segment}, 4); %uzywa kowariancji
            plot(pcovSound)
            title('Power Density Spectrum(pcov)')
            hold on;
        case 'peig'
            peigSound = peig(sound{1, i}.Segment{segment}, 8); %jakie� pseudospectrum...
            plot(peigSound)
            title('Power Density Spectrum(peig)')
            hold on;
        otherwise
            disp('program nie obs�uguje komendy.')
    end       
    xlabel('Frequenzy [Hz]');
    ylabel('Power density spectrum [dB]');
    % end
end
hold off;




% % znalezienie maksim�w lokalnych
% [pks,locs] = findpeaks(pdsSound,'SortStr','descend');
% numberOfMarkedPeaks = 15;
% hold on;
%
% %wy�wietlenie wynik�w
% plot(locs(1:numberOfMarkedPeaks,1), pks(1:numberOfMarkedPeaks,1), 'o');
% hold off;
% ylim([0, max(pks)]);
% xlim([0, 1000]);
end

