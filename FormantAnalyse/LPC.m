function [formants]= LPC(x1, Fs)
% liniowa 

%preemfaza - filtracja g�rnoprzepustowa
preemphase = [1 0.63];
x1 = filter(1,preemphase,x1);

%uzyskanie wsp�czynnik�w predykcji liniowej 
coefLPC = lpc(x1,8);

%wyznaczenie pierwiastk�w wielomianu na podstawie wsp�czynnik�w LPC
rootsOfLPC = roots(coefLPC);

%wybranie pierw. z dodatni� lub zerow� cz�ci� urojon�
rootsOfLPC = rootsOfLPC(imag(rootsOfLPC)>=0);
%okre�lenie k�t�w odpowiadaj�cych pierwiastkom wielomianu
anglesOfRoots = atan2(imag(rootsOfLPC), real(rootsOfLPC));

%przeliczenie cz�stotliwo�ci k�towej z rad/probki na Hz
[frequencyHz, index] = sort(anglesOfRoots.*(Fs/(2*pi)));
% szerokosc pasma to odleg�o�� przewidywanych zer wielomianu od jednostki
% ko�a
% bandwidth = -1/2*(Fs/(2*pi))*log(abs(rootsOfLPC(index)));

%wyznaczenie formant�w
% nn = 1;
for i = 1:length(frequencyHz)
    %if (frequencyHz(i) > 90 && bandwidth(i) <400)
    formants(i) = frequencyHz(i);
%     nn = nn+1;
    %end
end

end
