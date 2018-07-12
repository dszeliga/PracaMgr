function [] = ShowSpectrogramWithOriginalSignal(signal, t, Fs)
figure();
subplot(2,1,1)
showSpectrogram(signal', Fs);
title('spectrum');
xlabel('time [s]');
ylabel('Frequenzy [Hz]');
subplot(2,1,2)
plot(t, signal);
title('original signal')
xlabel('time [s]');
ylabel('Amplitude');
end

