clear all;
close all;
clc;

%wczytanie danych
load('SSraw.mat');

%anonimizacja danych
for i = 1 : length(data)
    s = data{i};
    s.FileName = [];
    s.Name = [];
    s.Surname = [];
    data{i} = s;
end

%data =  data(find(cell2mat(cellfun(@(x) x.Code ~=-1, data, 'UniformOutput', false))==1));

s =  data(find(cell2mat(cellfun(@(x) strcmp(x.SegmentType,'ASA')||strcmp(x.SegmentType,'ESE') ...
    ||strcmp(x.SegmentType,'ISI')||strcmp(x.SegmentType,'OSO')||strcmp(x.SegmentType,'USU') ... 
    ||strcmp(x.SegmentType,'YSY'), data, 'UniformOutput', false))==1));%SSraw;;

%s =  data(find(cell2mat(cellfun(@(x) strcmp(x.SegmentType,'ASA'), data, 'UniformOutput', false))==1));

%wybierz nagrania normatywne (0) i nienormatywne (2)
s0 = s(find(cell2mat(cellfun(@(x) x.TypeClass==0, s, 'UniformOutput', false))==1));
s1 = s(find(cell2mat(cellfun(@(x) x.TypeClass==2, s, 'UniformOutput', false))==1));

%pobierz s z kazdego slowa
s0signal = cell2mat(cellfun(@(x) x.Segment{4}', s0, 'UniformOutput', false));
s1signal = cell2mat(cellfun(@(x) x.Segment{4}', s1, 'UniformOutput', false));

Fs = data{1, 1}.Fs; %czêstotliwoœæ próbkowania
t0 = ChangeSamplesToTime(s0signal, Fs);
t1 = ChangeSamplesToTime(s1signal, Fs);


ShowSpectrogramWithOriginalSignal(s0signal, t0, Fs);
%ShowSpectrogramWithOriginalSignal(s1signal, t1, Fs);

figure();
subplot(2,2,1); ShowPowerDensitySpectrumAnalysis(s0, 4, 'periodogram');
subplot(2,2,2); ShowPowerDensitySpectrumAnalysis(s0, 4, 'pwelch');
subplot(2,2,3); ShowPowerDensitySpectrumAnalysis(s0, 4, 'pcov');
subplot(2,2,4); ShowPowerDensitySpectrumAnalysis(s0, 4, 'peig');
%%

% %Wczytanie danych
% path = 'C:\Users\LastWerewolf\Desktop\pracaMgr\nagrania podejscie 2\DS_11.wav';
% sound = ReadSound(path);
% info = audioinfo('C:\Users\LastWerewolf\Desktop\pracaMgr\nagrania podejscie 2\DS_11.wav');
% 
% Fs=info.SampleRate; %czêstotliwoœæ próbkowania
% T=info.TotalSamples/Fs; %czas trwania ca³ego sygna³u
% t=0:1/Fs:T-(1/Fs); %wektor czasu
% 
% subplot(2,2,1);
% plot(t, sound);
% %plot(sound);
% %xlabel('number of samples');
% xlabel('Time[s]');
% ylabel('Amplitude');
% title('Original Signal');
% axis([0, max(t), 0, max(sound)]);
% 
% sound = sound(85000:87000); % wybrany jakiœ fragment na sztywno, chwilowo
% t1=0:1/Fs:((length(sound)/Fs)-(1/Fs)); %wektor czasu wybranego fragmentu
% 
% %zmiana skali czasowej na [-3 3]
% range = max(t1) - min(t1);
% t1 = (t1 - min(t1)) / range;
% x = -3;
% y = 3;
% range2 = y - x;
% t1 = (t1 * range2) + x;
% 
% subplot(2,2,2);
% plot(t1,sound);
% title('Selected Signal');
% xlabel('Time [s]');
% % soundsc(sound, Fs);
% % xlabel('number of samples');
% ylabel('Amplitude');
% xlim([-3, 3]);

% %wyœwietlenie krzywej rozk³adu normalnego
% hold on;
% normalDistribution = normpdf(t1,0,1);
% plot(t1, normalDistribution);
% hold off;

% %Analiza widmowa (FFT?)
% [amplitudeSpectrum, phaseSpectrum] = SpectralAnalysis(sound);
% 
% %Analiza widma gestosci mocy
% PowerDensitySpectrumAnalysis(sound);
% 
% % jakies tam dalsze przetwarzanie pewnie...
% 
% %Klasyfikacja
% %Classification(data);