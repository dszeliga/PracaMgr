function [timeVector] = ChangeSamplesToTime(signal, Fs)
T0 = length(signal)/Fs; %czas trwania ca�ego sygna�u
timeVector = 0:1/Fs:T0-(1/Fs); %wektor czasu

end

