function [pdsSound] = PowerDensitySpectrumAnalysis(sound)
%Analiza widma gestosci mocy
figure();
pdsSound = periodogram(sound);
plot(pdsSound)
% znalezienie maksimów lokalnych
[pks,locs] = findpeaks(pdsSound,'SortStr','descend');
hold on;
plot(locs(1:10,1), pks(1:10,1), 'o');
hold off;
title('Power Density Spectrum')
xlabel('');
ylabel('');
xlim([0, 600])

end

