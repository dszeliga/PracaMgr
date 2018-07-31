function [] = showFormants( signal, Fs, segment, t0)
%znajdz formanty
formants = findFormants(signal, Fs, segment);

%znajdz srodki segmentów
allMiddles =[];

if exist('segment', 'var') && ~isempty(segment)
    for i=1:length(signal)
        middleOfSegment = floor(length(signal{1,i}.Segment{segment})/2);
        allMiddles =[allMiddles; middleOfSegment];
    end
else
    middleOfSegment = floor(length(signal)/2);
    allMiddles =[allMiddles; middleOfSegment];
end

% utwórz wektor czasu
t(1) = allMiddles(1);
for k = 2:length(allMiddles)
    t(k) = t(k-1) + allMiddles(k-1)+allMiddles(k);
end

for l = 1:length(t)
    t(l)=(t(l)*max(t0))/max(t);
end

hold on;
% for m=1:size(formants,2)
%     plot(t,formants(:,m), '.k', 'Markersize', 10);
% end
plot(t,formants(:,1), '.w', 'Markersize', 10);
plot(t,formants(:,2), '.m', 'Markersize', 10);
plot(t,formants(:,3), '.b', 'Markersize', 10);
plot(t,formants(:,4), '.k', 'Markersize', 10);
legend('F1', 'F2','F3', 'F4', 'Location', 'northeastoutside');
hold off;
end

