function [] = ShowSpectrogramWithOriginalSignal(signalSpectrum, signalFormant, segment, t, Fs)
figure();
subplot(2,1,1)
showSpectrogram(signalSpectrum', Fs);
hold on;
showFormants(signalFormant, Fs, segment, t);
hold off;
title('Spectrogram with Formants');
xlabel('time [s]');
ylabel('Frequenzy [Hz]');
set(gca,'YTick',0:1000:20000);
grid on;

subplot(2,1,2)
plot(t, signalSpectrum);
title('original signal');
xlabel('time [s]');
ylabel('Amplitude');
end

