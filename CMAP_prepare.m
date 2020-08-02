%% CMAP separation
%
% The purpose of this script is to take one long signal that contains multiple CMAPs, separate the CMAPs into individual signals, 
% and then plots the CMAPs (individually and with overlay)
%
%
% INPUTS
%
% time     = the time signal (must be same length as CMAP signal)
% signal   = long multi-CMAP EMG signal
% Fs       = sampling frequency of EMG signal
% Fcmap    = frequency of CMAPs (i.e. stimulation frequency, ~2Hz)
% n        = number of CMAPs to separate
% jj       = leave as 1; if distance between CMAPs are not uniform, 
%               jj<1 makes the cut-off distance shorter (if 2 CMAPs end up together after separation)
%               jj<1 makes the cut-off distance longer (if some CMAPs are too spread out)
%
%
% OUTPUTS
%
% CMAP        = n x ((Fs/Fcmap)*jj) x 3
% CMAP(:,:,1) = CMAPs aligned by their stimulation artifact
% CMAP(:,:,2) = absolute value of aligned CMAPs 
% CMAP(:,:,3) = derivative of aligned CMAPs (used for signal alignment)
%
% 
% Updated 2020-07-30 by Alexis L. Lowe
%
%% 

function CMAP = CMAP_prepare(time,signal,Fs,Fcmap,n,jj)

% Use designfilt in order to find the derivative of signal

Nf = 50;		% filter order
Fpass = 3000;		% filter passband frequency
Fstop = 4000;		% filter stopband frequency
d = designfilt('differentiatorfir','FilterOrder',Nf, ...
'PassbandFrequency',Fpass,'StopbandFrequency',Fstop, ...
'SampleRate',Fs);
%fvtool(d,'MagnitudeDisplay','zero-phase','Fs',Fs)      % turn this on to visualize the filter

dt = time(2)-time(1);
vsignal = filter(d,signal)/dt;
delay = mean(grpdelay(d));

%tt = time(1:end-delay);
vE = vsignal;
vE(1:delay) = [];
%tt(1:delay) = [];
vE(1:delay) = [];


% Use this plot to look at signal vs. derivative before CMAP separation 
%
% subplot(2,1,1)
% plot(time,signal)
% xlabel('Time (s)')
% ylabel('Voltage')
% grid
% 
% subplot(2,1,2)
% plot(tt,vE)
% xlabel('Time (s)')
% ylabel('Volts per second')
% grid

%% Separate the CMAPs
%

x = 0.1;                            % x = threshold velocity for stimulation artifact (V/s)
tst = find(abs(vE)>x,1,'first');	% tst = time of first CMAP stim artifact
if vE(tst) > 0                      % make the stimulation artifact deflect done (anodic)
    signal = -signal;
    vE = -vE;
end

gap = round((Fs*0.02),0);		% put a 20 ms gap before the start of stim artifact
place = tst - gap;			
start = place;
len = round(((Fs/Fcmap)*jj),0);
rCAP = zeros(n,len,3);
i = 1;
j = 1;


while i < (n+1)				% break the CMAPs up into separate columns of array rCAP
    rCAP(i,j,1) = signal(place);
    rCAP(i,j,2) = abs(signal(place));
    rCAP(i,j,3) = vE(place);
        while j < len
            j = j +1;
            place = place+1;
            rCAP(i,j,1) = signal(place);
            rCAP(i,j,2) = abs(signal(place));
            rCAP(i,j,3) = vE(place);
        end
     i = i+1;
     j = 1;
     place = place + 1;
end

%% Align the CMAPs
% 
% Each column of rCAP is aligned so that the stim artifacts start on the same row
% The plot generated shows individual CMAPs after alignment
% If there is more than one CMAP on the first plot, 0.8 < jj < 0.95
% 

CMAP = zeros(n,len,3);
CMAP(1,:,:) = rCAP(1,:,:);

i = 2;
f = waitbar(0,'1','Name','Aligning CMAPs...',...
    'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
setappdata(f,'canceling',0);

while i < (n+1)
    d = finddelay(rCAP(1,:,1),rCAP(i,:,1));		% aligns the CMAPs based on their raw signal
							% change rCAP(i,:,x) to change the alignment signal
  
    % Check for clicked Cancel button
    if getappdata(f,'canceling')
        break
    end
    
    % Update waitbar and message
    waitbar(i/n,f,sprintf('%0.0f',i))
    
    if d == 0
        CMAP(i,:,:) = rCAP(i,:,:);
        
    else
        a = start + ((i-1)*len) + d;
        b = a + len - 1;
        CMAP(i,:,1) = signal(a:b);
        CMAP(i,:,2) = abs(CMAP(i,:,1));
        CMAP(i,:,3) = vE(a:b);
        
    end
    i = i+1;
end

delete(f)		% Close waitbar


% Plot the Aligned CMAPs

len=length(CMAP);
time = time(1:len);

plot_CMAPs(time,CMAP);

end




    
    
            
            


