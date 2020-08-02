%% CMAP_stats
%
% This is a function for determining 6 different measurements from
% an array of aligned CMAPs
%
% INPUTS :
% 
% CMAP  = array of aligned CMAPs that is n x len x 3
% Fs    = sampling rate of signal
% stim  = time (in seconds) that stimulation artifact begins
% start = time (in seconds) that CMAP begins
% stop  = time (in seconds) that CMAP derivative stabilizes around zero
%
%
% OUTPUTS :
%
% Amplitude     = Maximum amplitude of each CMAP (in Volts)
% AbsAmplitude  = Maximum absolute amplitude of each CMAP (in Volts)
% StimAmplitude = Maximum amplitude of the stimulation artifact (in Volts)
% MAV           = Mean absolute value of each CMAP (in Volts)
% Duration      = stop - start (in milliseconds)
% RectifAUC     = sum of all the CMAP sample values between start and stop
%                 this is a very poor proxy for AUC but I couldn't quite
%                 figure out integrations in MATLAB for signals
%
% The output is a table called 'stats'. Opening the table in the variable
% editor window allows you to easily copy/paste into Excel.
% 
% Updated 2020-07-30 by Alexis L. Lowe
%
%%

function stats = CMAP_stats(CMAP,Fs,stim,start,stop)

stats = zeros(20,6);

stim = round((stim*Fs),0);
start = round((start*Fs),0);
stop = round((stop*Fs),0);

stimonly = CMAP(1:20,stim:start,2);
conlynorm = CMAP(1:20,start:end,1);
conlyabs= CMAP(1:20,start:end,2);

i = 1;

stats(:,1) = max(conlynorm,[],2);
stats(:,2) = max(conlyabs,[],2);
stats(:,3) = max(stimonly,[],2);
stats(:,4) = mean(CMAP(i,start:stop,2));
stats(:,5) = ((stop-start)*1000)/Fs;
stats(:,6) = sum(CMAP(i,start:stop,2));
  
stats = array2table(stats,'RowNames',{'CMAP 1','CMAP 2', 'CMAP 3', 'CMAP 4', 'CMAP 5', 'CMAP 6',...
'CMAP 7', 'CMAP 8', 'CMAP 9', 'CMAP 10','CMAP 11','CMAP 12','CMAP 13','CMAP 14','CMAP 15',...
'CMAP 16','CMAP 17','CMAP 18','CMAP 19','CMAP 20'},'VariableNames',{'Amplitude','AbsAmplitude',...
'StimAmplitude','MAV','Duration','RectifAUC'});

end

