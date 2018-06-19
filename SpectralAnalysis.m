function [amplitudeSpectrum,phaseSpectrum] = SpectralAnalysis(sound)
%Analiza widmowa (FFT?)
signal = fft(sound); %obliczanie DFT ci�gu x
amplitudeSpectrum = abs(signal); % widmo amplitudowe
phaseSpectrum = unwrap(angle(signal)); %widmo fazowe;

%wy�wietlenie
subplot(2,2,3);
plot(amplitudeSpectrum);
title('Amplitude Spectrum')
xlabel('Frequenzy [Hz]');
ylabel('Amplitude')

subplot(2,2,4);
plot(phaseSpectrum);
title('Phase Spectrum')
xlabel('Frequenzy [Hz]');
ylabel('Phase')
end

