letter= 'G';
for i =1:12
    path = sprintf('nagrania\\%s\\%s-0%d.wav',letter, letter, i);
    
    if(i>9)
       path = sprintf('nagrania\\%s\\%s-%d.wav',letter, letter, i); 
    end
    
   data{i} = audioread(path);  
   
end

switch(letter)
    case 'S'
        save plikiMat/S.mat data;
    case 'Z'
        save plikiMat/Z.mat data;
    case 'C'
        save plikiMat/C.mat data;
    case 'DZ'
        save plikiMat/DZ.mat data;
    case 'SZ'
        save plikiMat/SZ.mat data;
    case 'RZ'
        save plikiMat/RZ.mat data;
    case 'CZ'
        save plikiMat/CZ.mat data;
    case 'D¯'
        save plikiMat/D¯.mat data;
    otherwise
        disp('Folder z nagraniami nie istnieje.');
end

