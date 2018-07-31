clear all;
close all;
clc;

[d, Fs]=audioread('nagrania\costam.wav');
d=d(:,1);
NFFT=256; % liczba punktów FFT

dft=fft(d,NFFT); %FFT
p  = mag2db(abs(dft));
%p=p-40;
df = Fs/NFFT ;
freq = 0:df:Fs/2-df ;
figure;
plot (freq,p(1:end/2));

%zmiana z Hz na mel
DFTmel = (1000/log(2))*log(1+dft/1000);

%obliczenie dct
dctS = dct(d,3);
%przeliczenie na skale melow¹
DCTmel = (1000/log(2))*log(1+dctS/1000);

%zmiana z mel na hz
%hertz = 1000*((exp(mel/(1000/log(2)))-1))

%C(1)-œrednia, C(2)-nachylenie c(3)-krzywizna

k= [0, 0.5, 1];
for m = 1:3
   for n = 1:NFFT
       C(m) = ((2*k(m))/NFFT)*sum(DFTmel(n)*cos(((2*n)+(m*pi)/(2*NFFT))));
   end
end

% [cepstralCoef, matrixOfFilterbankEnergies, frames]=mfcc(signal, Fs, frameDuration, frameShift, 
% preemphaseCoef, window, freqRangeForFilterbankAnalyse, numberOfFilterbankChannels, numberOfCoef, liftering);
[cepstralCoef,filterBankEnergies,frames]=mfcc(d,Fs, 25, 10, 0.8, @hamming, [0 Fs/2], 10, 3, 22);

lpc2cc= dsp.LPCToCepstral;
CC = step(lpc2cc,d);

%cepstralne powinno byc to samo co DCT (??)
cepstralCoef=cepstralCoef(1:3)
DCTmel=DCTmel'
C
CC=CC(1:3)'