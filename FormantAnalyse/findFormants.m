function [allFormants] = findFormants( signal, Fs, segment)
allFormants =[];
if exist('segment','var')
    for p = 1:length(signal)
        %filtracja okienkowa oknem Hamminga
        x1 = signal{1, p}.Segment{segment}.*hamming(length(signal{1, p}.Segment{segment}));
        %wyznaczenie formantów i utworzenie macierzy z wartosciami 
        formants = LPC(x1, Fs);
        if(length(formants)==5)
            formants(:,1)=[];
        end
        allFormants = [allFormants; formants];
    end
else
    %filtracja okienkowa oknem Hamminga
    x1=signal.*hamming(length(signal));
    %wyznaczenie formantów
    formants = LPC(x1, Fs);
    allFormants = [allFormants; formants];
end

end




