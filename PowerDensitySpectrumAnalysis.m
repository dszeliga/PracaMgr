function [pdsSound] = PowerDensitySpectrumAnalysis(sound)
%Analiza widma gestosci mocy
figure();
pdsSound = periodogram(sound);
plot(pdsSound)
% znalezienie maksim�w lokalnych
[pks,locs] = findpeaks(pdsSound,'SortStr','descend');
hold on;
plot(locs(1:15,1), pks(1:15,1), 'o');
hold off;
title('Power Density Spectrum')
xlabel('');
ylabel('');
ylim([0, max(pks)]);
xlim([0, 1000])
end

