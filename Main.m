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

s =  data(find(cell2mat(cellfun(@(x) strcmp(x.SegmentType,'ASA')...
,data, 'UniformOutput', false))==1));%SSraw;;
% ||strcmp(x.SegmentType,'ESE') ...
% ||strcmp(x.SegmentType,'ISI') ...
% ||strcmp(x.SegmentType,'OSO') ...
% ||strcmp(x.SegmentType,'USU') ... 
% ||strcmp(x.SegmentType,'YSY') ...

%s =  data(find(cell2mat(cellfun(@(x) strcmp(x.SegmentType,'ASA'), data, 'UniformOutput', false))==1));

%wybierz nagrania normatywne (0) i nienormatywne (2)
s0 = s(find(cell2mat(cellfun(@(x) x.TypeClass==0, s, 'UniformOutput', false))==1));
s1 = s(find(cell2mat(cellfun(@(x) x.TypeClass==2, s, 'UniformOutput', false))==1));

%pobierz s z kazdego slowa
s0signal = cell2mat(cellfun(@(x) x.Segment{4}', s0, 'UniformOutput', false));
%s1signal = cell2mat(cellfun(@(x) x.Segment{4}', s1, 'UniformOutput', false));

%filtracja butterwortha
%  [b,a] = butter(3, 0.1);
%  s0signal = filter(b, a, s0signal);

Fs = data{1, 1}.Fs; %czêstotliwoœæ próbkowania
t0 = ChangeSamplesToTime(s0signal, Fs);
%t1 = ChangeSamplesToTime(s1signal, Fs);

%ShowSpectrogramWithOriginalSignal(s0signal, s0, 4, t0, Fs);
%ShowSpectrogramWithOriginalSignal(s1signal, t1, Fs);

figure();
formants = LPCAnalyse(s0,4, Fs);
formants(:,1) =[];
hold on;
plot(formants, '.k');
hold off;


% figure();
% subplot(2,1,1); ShowPowerDensitySpectrumAnalysis(s0, 4);
% subplot(2,1,2); showSPL(s0, 4, Fs);


%%
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