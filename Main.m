clear all;
close all;
clc;
%Wczytanie danych
path = 'C:\Users\LastWerewolf\Desktop\pracaMgr\nagrania podejscie 2\DS_11.wav';
sound = ReadSound(path);
info = audioinfo('C:\Users\LastWerewolf\Desktop\pracaMgr\nagrania podejscie 2\DS_11.wav');

Fs=info.SampleRate; %cz�stotliwo�� pr�bkowania
T=info.TotalSamples/Fs; %czas trwania ca�ego sygna�u
t=0:1/Fs:T-(1/Fs); %wektor czasu

subplot(2,2,1);
plot(t, sound);
%plot(sound);
title('Original Signal')
%xlabel('number of samples')
xlabel('Time[s]');
ylabel('Amplitude')
axis([0, max(t), 0, max(sound)]);

sound = sound(85000:87000); % wybrany jaki� fragment na sztywno, chwilowo
t1=0:1/Fs:((length(sound)/Fs)-(1/Fs)); %wektor czasu wybranego fragmentu

range = max(t1) - min(t1);
t1 = (t1 - min(t1)) / range;
x=-3;
y=3;
range2 = y - x;
t1 = (t1 * range2) + x;

subplot(2,2,2);
plot(t1,sound);
title('Selected Signal');
xlabel('Time [s]')
soundsc(sound, Fs);
% xlabel('number of samples');
ylabel('Amplitude');
xlim([-3, 3]);

hold on;
nn = normpdf(t1,0,1);
plot(t1, nn);
hold off;


%Segmentacja polozenia gloski w wyrazie
%selectedCharacter = SegmentationOfWord(sound);

%Segmentacja faz w glosce (nastep, szczyt, zestep)
%selectedPhase = SegmentationOfCharacter(selectedCharacter);

%Analiza widmowa (FFT?)
[amplitudeSpectrum, phaseSpectrum] = SpectralAnalysis(sound);

%Analiza widma gestosci mocy
PowerDensitySpectrumAnalysis(sound);

% jakies tam dalsze przetwarzanie pewnie...

%Klasyfikacja
%Classification(data);