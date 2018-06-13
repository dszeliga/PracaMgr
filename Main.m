%Wczytanie danych
path = '';
sound = ReadSound(path);

%Segmentacja polozenia gloski w wyrazie
selectedCharacter = SegmentationOfWord(sound);

%Segmentacja faz w glosce (nastep, szczyt, zestep)
selectedPhase = SegmentationOfCharacter(selectedCharacter);

%Analiza widmowa (FFT?)
soundAfterFFT = SpectralAnalysis(selectedPhase);

%Analiza widma gestosci mocy
soundAfterPDS = PowerDensitySpectrumAnalysis(selectedPhase);

% jakies tam dalsze przetwarzanie pewnie...

%Klasyfikacja
Classification(data);