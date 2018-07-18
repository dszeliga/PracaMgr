clear all;
close all;
clc;
%%
%referencje do funkcji
addpath(strcat(pwd,'\Shows'));
addpath(strcat(pwd,'\FormantAnalyse'));
%%
%wczytanie danych
[s, s0, s0signal] = ReadSound('SSraw.mat');

%filtracja butterwortha- yyy nie umia...
%  [b,a] = butter(3, 0.1);
%  s0signal = filter(b, a, s0signal);

Fs = s{1, 1}.Fs; %czêstotliwoœæ próbkowania
t0 = ChangeSamplesToTime(s0signal, Fs);

%wyswietlenie spectrogramu z analiz¹ formantow¹ i sygna³em oryginalnym
ShowSpectrogramWithOriginalSignal(s0signal, s0, 4, t0, Fs);

%wyœwietlenie poziomu ciœnienia akustycznego i widma gêstoœci mocy
figure();
subplot(2,1,1); ShowPowerDensitySpectrumAnalysis(s0, 4);
subplot(2,1,2); showSPL(s0, 4, Fs);