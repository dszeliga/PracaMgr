function [s, s0, s0signal] = ReadSound(filename)
%wczytanie danych
load(filename);

%anonimizacja danych
for i = 1 : length(data)
    s = data{i};
    s.FileName = [];
    s.Name = [];
    s.Surname = [];
    data{i} = s;
end

%data =  data(find(cell2mat(cellfun(@(x) x.Code ~=-1, data, 'UniformOutput', false))==1));

% wczytanie danych
% s =  data(find(cell2mat(cellfun(@(x) strcmp(x.SegmentType,'ASA')...    
% ||strcmp(x.SegmentType,'ESE') ...
% ||strcmp(x.SegmentType,'ISI') ...
% ||strcmp(x.SegmentType,'OSO') ...
% ||strcmp(x.SegmentType,'USU') ... 
% ||strcmp(x.SegmentType,'YSY') ...
% ,data, 'UniformOutput', false))==1));%SSraw;

s =  data(find(cell2mat(cellfun(@(x) strcmp(x.SegmentType,'ASA'), data, 'UniformOutput', false))==1));

%wybierz nagrania normatywne (0) i nienormatywne (2)
s0 = s(find(cell2mat(cellfun(@(x) x.TypeClass==0, s, 'UniformOutput', false))==1));
% s1 = s(find(cell2mat(cellfun(@(x) x.TypeClass==2, s, 'UniformOutput', false))==1));

%pobierz s z kazdego slowa
s0signal = cell2mat(cellfun(@(x) x.Segment{4}', s0, 'UniformOutput', false));
%s1signal = cell2mat(cellfun(@(x) x.Segment{4}', s1, 'UniformOutput', false));
end

