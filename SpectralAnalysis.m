function [amplitudeSpectrum,phaseSpectrum] = SpectralAnalysis(sound)
%Analiza widmowa (FFT?)
signal = fft(sound); %obliczanie DFT ci�gu x
amplitudeSpectrum = abs(signal); % widmo amplitudowe
phaseSpectrum = unwrap(angle(signal)); %widmo fazowe;
end

