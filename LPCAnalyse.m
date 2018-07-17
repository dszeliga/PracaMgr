function [ allFormants ] = LPCAnalyse( signal, segment, Fs )
allFormants =[];
for p = 1:length(signal)
    x1 = signal{1, p}.Segment{segment}.*hamming(length(signal{1, p}.Segment{segment}));
    preemph = [1 0.63];
    x1 = filter(1,preemph,x1);
    
    A = lpc(x1,8);
    rts = roots(A);
    
    rts = rts(imag(rts)>=0);
    angz = atan2(imag(rts),real(rts));
    
    [frqs,indices] = sort(angz.*(Fs/(2*pi)));
    bw = -1/2*(Fs/(2*pi))*log(abs(rts(indices)));
    
    nn = 1;
    for kk = 1:length(frqs)
        %if (frqs(kk) > 90 && bw(kk) <400)
        formants(nn) = frqs(kk);
        nn = nn+1;
        %end
    end
    allFormants = [allFormants; formants];
end
end

