function showSpectrogram(x, fs)
    Tw = 12;%25;% 30;           % czas trwania analizowanej ramki (ms)
    Ts = 6;%10;%25;           % czas przesuniecia analizowanej ramki (ms)
    window = @hamming; % typ okna
    Nw = round( 1E-3 * Tw * fs );    % czas trwania ramki (lb próbek)
    Ns = round( 1E-3 *  Ts * fs );    % przesuniêcie (lb próbek)
    
    if iscell(x) == 1
        x = cell2mat(x');
    end
    
    micCount = size(x, 2); 
    %h = figure('position', [400, 300, 1300, 700]);
    for i = 1 : micCount
        xx = x(:, i);
        [s, f, t, p] = spectrogram(xx, hamming(Nw), Ns, Nw, fs);
%         if(length(f)>450)
%             p=p(1:450,:);
%             f=f(1:450);
%         end
        F{i} = f;
        P{i} = p;
        T{i} = t;
    end
    
    maxValue = 10*log10(abs(max(cell2mat(cellfun(@(x) max(x), P, 'UniformOutput', false)))));
    minValue = 10*log10(abs(min(cell2mat(cellfun(@(x) min(x), P, 'UniformOutput', false)))));
    
    for i = 1 : micCount
        if micCount ~= 1
            if micCount == 15
                % 1     4	7	10	13
                % 2     5	8	11	14
                % 3     6	9	12	15

                % 1	    2	3	4	5
                % 6	    7	8	9	10
                % 11	12	13	14	15

                subplot(3, 5, 1);  getImg(1, T, F, P, '1', '1', maxValue, minValue);
                subplot(3, 5, 2);  getImg(4, T, F, P, '2', '', maxValue, minValue);
                subplot(3, 5, 3);  getImg(7, T, F, P, '3', '', maxValue, minValue);
                subplot(3, 5, 4);  getImg(10, T, F, P, '4', '', maxValue, minValue);
                subplot(3, 5, 5);  getImg(13, T, F, P, '5', '', maxValue, minValue);
                
                subplot(3, 5, 6);  getImg(2, T, F, P, '', '2', maxValue, minValue);
                subplot(3, 5, 7);  getImg(5, T, F, P, '', '', maxValue, minValue);
                subplot(3, 5, 8);  getImg(8, T, F, P, '', '', maxValue, minValue);
                subplot(3, 5, 9);  getImg(11, T, F, P, '', '', maxValue, minValue);
                subplot(3, 5, 10); getImg(14, T, F, P, '', '', maxValue, minValue);
                
                subplot(3, 5, 11); getImg(3, T, F, P, '', '3', maxValue, minValue);
                subplot(3, 5, 12); getImg(6, T, F, P, '', '', maxValue, minValue);
                subplot(3, 5, 13); getImg(9, T, F, P, '', '', maxValue, minValue);
                subplot(3, 5, 14); getImg(12, T, F, P, '', '', maxValue, minValue);
                subplot(3, 5, 15); getImg(15, T, F, P, '', '', maxValue, minValue);
                return
                %subplot(3, 5, i); 
            elseif micCount == 7
                subplot(3, 3, 1);  getImg(1, T, F, P, '1', '1', maxValue, minValue);
                subplot(3, 3, 3);  getImg(5, T, F, P, '2', '', maxValue, minValue);
                subplot(3, 3, 4);  getImg(2, T, F, P, '3', '', maxValue, minValue);
                subplot(3, 3, 5);  getImg(4, T, F, P, '4', '', maxValue, minValue);
                subplot(3, 3, 6);  getImg(6, T, F, P, '5', '', maxValue, minValue);
                subplot(3, 3, 7);  getImg(3, T, F, P, '5', '', maxValue, minValue);
                subplot(3, 3, 9);  getImg(7, T, F, P, '5', '', maxValue, minValue);
                return
            elseif micCount == 5
                subplot(1, 5, i); 
            else
                subplot(1, 1, i); 
            end
        end
        im = imagesc(T{i}, F{i}, 10*log10(abs(P{i})));
        caxis([minValue maxValue])
        axis xy;
        colormap(jet);
        %axis([-0.25  0.25 0 15000 ])
    end
end
function [ h ] = getImg(i, T, F, P, t, y, maxValue, minValue)
     im = imagesc(T{i}, F{i}, 10*log10(abs(P{i}))); 
     caxis([minValue maxValue])
     axis xy;
     colormap(jet); 
     axis([-0.25  0.25 0 15000 ])
     title(t);
     ylabel(y);
end
