function [formants]= LPC(x1, Fs)
% liniowa 

%preemfaza - filtracja górnoprzepustowa
preemphase = -0.8;
x1 = filter(1,preemphase,x1);

%uzyskanie wspó³czynników predykcji liniowej 
coefLPC = lpc(x1,8);

%wyznaczenie pierwiastków wielomianu na podstawie wspó³czynników LPC
rootsOfLPC = roots(coefLPC);

%wybranie pierw. z dodatni¹ lub zerow¹ czêœci¹ urojon¹
rootsOfLPC = rootsOfLPC(imag(rootsOfLPC)>=0);

%okreœlenie k¹tów odpowiadaj¹cych pierwiastkom wielomianu
anglesOfRoots = atan2(imag(rootsOfLPC), real(rootsOfLPC));

%przeliczenie czêstotliwoœci k¹towej z rad/probki na Hz
[frequencyHz, index] = sort(anglesOfRoots.*(Fs/(2*pi)));
% szerokosc pasma to odleg³oœæ przewidywanych zer wielomianu od jednostki
% ko³a
% bandwidth = -1/2*(Fs/(2*pi))*log(abs(rootsOfLPC(index)));

%wyznaczenie formantów
% nn = 1;
for i = 1:length(frequencyHz)
    %if (frequencyHz(i) > 90 && bandwidth(i) <400)
    formants(i) = frequencyHz(i);
%     nn = nn+1;
    %end
end

end
