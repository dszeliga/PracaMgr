clear all;
close all;
clc;
%Wczytanie danych
path = 'C:\Users\LastWerewolf\Desktop\pracaMgr\nagrania podejscie 2\DS_11.wav';
sound = ReadSound(path);
info = audioinfo('C:\Users\LastWerewolf\Desktop\pracaMgr\nagrania podejscie 2\DS_11.wav');

Fs=info.SampleRate;
T=info.TotalSamples/Fs;
t=0:1/Fs:T-(1/Fs);

subplot(2,2,1);
plot(t, sound);
%plot(sound);
title('Original Signal')
%xlabel('number of samples')
xlabel('Time[s]');
ylabel('Amplitude')

sound = sound(40000:50000);
t1=0:1/Fs:((length(sound)/Fs)-(1/Fs));
subplot(2,2,2);
plot(t1,sound);
title('Selected Signal');
xlabel('Time [s]')
% xlabel('number of samples');
ylabel('Amplitude');
%Segmentacja polozenia gloski w wyrazie
%selectedCharacter = SegmentationOfWord(sound);

%Segmentacja faz w glosce (nastep, szczyt, zestep)
%selectedPhase = SegmentationOfCharacter(selectedCharacter);

%Analiza widmowa (FFT?)
[amplitudeSpectrum, phaseSpectrum] = SpectralAnalysis(sound);

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
%Analiza widma gestosci mocy
%soundAfterPDS = PowerDensitySpectrumAnalysis(selectedPhase);

% jakies tam dalsze przetwarzanie pewnie...

%Klasyfikacja
%Classification(data);