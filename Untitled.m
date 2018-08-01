SZ = load('plikiMat\SZ.mat');
S = load('plikiMat\S.mat');
Z = load('plikiMat\Z.mat');
RZ = load('plikiMat\RZ.mat');
C = load('plikiMat\C.mat');
DZ = load('plikiMat\DZ.mat');
CZ = load('plikiMat\CZ.mat');
DZY = load('plikiMat\D¯.mat');
Fs=44100;

figure;
coefSZ=[]; coefS=[]; coefZ=[]; coefRZ=[]; coefC=[]; coefDZ=[]; coefCZ=[]; coefDZY=[];
for i=1:12
    coefSZ = [coefSZ dct(SZ.data{i}, 3)];
    coefS = [coefS dct(S.data{i}, 3)];
    coefZ = [coefZ dct(Z.data{i}, 3)];
    coefRZ = [coefRZ dct(RZ.data{i}, 3)];
    coefC = [coefC dct(C.data{i}, 3)];
    coefDZ = [coefDZ dct(DZ.data{i}, 3)];
    coefCZ = [coefCZ dct(CZ.data{i}, 3)];
    coefDZY = [coefDZY dct(DZY.data{i}, 3)];
 
    hold on
end
plot(mean(coefSZ'),'*r');
plot(mean(coefS'),'*g');
plot(mean(coefZ'),'*b');
plot(mean(coefRZ'),'*c');
plot(mean(coefC'),'*m');
plot(mean(coefDZ'),'*y');
plot(mean(coefCZ'),'*k');
plot(mean(coefDZY'),'.k');
grid on;
xlabel('number of coef DCT');
ylabel('value of coef DCT');
legend('SZ','S','Z','RZ','C','DZ','CZ','D¯');
hold off;
%%
Tw = 20;           % analysis frame duration (ms)
Ts = 10;           % analysis frame shift (ms)
NFFT=256;
midPoints=[];


sound = C.data;
for i=1:12
    FFT = fft(sound{i}, NFFT);
    formants = LPC(FFT, Fs);
    %[coeffs,fe,frames] = mfcc(sound{i}, Fs, Tw, Ts, -0.8, @hamming, [0 Fs/2], 5, 3, 20);
%     lpc2cc= dsp.LPCToCepstral;
%     CC = step(lpc2cc,sound{i});
    midPoints= [midPoints  FFT(floor(length(FFT/2)))];    
end
midPointsMel = (1000/log(2))*log(1+midPoints/1000);


k= [0.5, 1, 1.5];
C=[];
for m = 1:3
   for n = 1:NFFT
       C(m) = ((2*k(m))/NFFT)*sum(double(FFT(n))*cos(((2*n)+(m*pi)/(2*NFFT))));
   end
end


