function output = smoothData(input)

output = input;

d1 = designfilt('lowpassiir','FilterOrder',12, ...
    'HalfPowerFrequency',0.15,'DesignMethod','butter');
              % zero-phase filtering

% for i = 1:length(input)
%     if i > 15
%         output(i) = mean(input(i-15:i));
%     end
%     
% 
% output = filtfilt(d1,input);  
output = input;

end

