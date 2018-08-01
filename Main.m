clear all;
close all;
clc;
%%

% y= cell2mat( cellfun(@(x) x.Segment{8}', s0, 'UniformOutput', false));
% y = data;%(1:44100*2);
%  SPL = spl(y,'air',512); % <-- Here's how to use the function. 
%  
% t = cumsum(ones(size(y))/Fs);
% figure
% subplot(2,1,1)
% plot(t,y)
% axis tight
% ylabel('pressure (Pa)')
% 
% subplot(2,1,2)
% plot(t,SPL)
% axis tight
% ylabel('spl (dB)')
% xlabel('time (s)')



%%

%referencje do funkcji

addpath(strcat(pwd,'\Shows'));
addpath(strcat(pwd,'\FormantAnalyse'));
%%
%wczytanie danych
[s, s0, s0signal] = ReadSound('SSraw.mat');

%filtracja butterwortha- yyy nie umia... ^^
%  [b,a] = butter(3, 0.1);
%  s0signal = filter(b, a, s0signal);

Fs = s{1, 1}.Fs; %cz�stotliwo�� pr�bkowania
t0 = ChangeSamplesToTime(s0signal, Fs);

%wyswietlenie spectrogramu z analiz� formantow� i sygna�em oryginalnym
ShowSpectrogramWithOriginalSignal(s0signal, s0, 4, t0, Fs);

%wy�wietlenie poziomu ci�nienia akustycznego i widma g�sto�ci mocy
figure();
subplot(2,1,1); ShowPowerDensitySpectrumAnalysis(s0, 4);
subplot(2,1,2); showSPL(s0, 4, Fs);

%%
load('plikiMat\S.mat');
Fs=44100;
showSPL(data,[],Fs);
