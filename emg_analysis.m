clear all;
close all;

file = '20200304 TO34-L-dn 50uA.mat';
leg = 'TO34 Left';

ylimits = [-0.0045,0.0045];
xlimits = [85,120];

load(file);
addpath(genpath('emg_functions_1_0_0_0')); % path where you stored the EMG functions folder

% if signal is upside down
%allEMG = allEMG * -1;

period = emgTime(2);
freq = 1/period;

filtEMG = filterEMG(allEMG', freq, 2, 450); %filter the EMG signal using JLB's code

%filtEMG = filterEMG(allEMG', freq, 200, 4000);

figure();

plot(emgTime,filtEMG(1,:),'Color','k');
ylim(ylimits);
% xlim(xlimits);
ax = gca;
ax.FontSize = 14;
title(leg,'FontSize',16);
xlabel('time(s)','FontSize',16)
ylabel('Volts','FontSize',16)

% 
% subplot(2,2,2);
% plot(emgTime,filtEMG(2,:),'Color','k');
% ylim(ylimits);
% xlim(xlimits);
% ax = gca;
% ax.FontSize = 14;
% title('B','FontSize',16);
% xlabel('time(s)','FontSize',16)
% ylabel('Volts','FontSize',16)
% 
% subplot(2,2,3);
% plot(emgTime,filtEMG(3,:),'Color','k');
% ylim(ylimits);
% xlim(xlimits);
% ax = gca;
% ax.FontSize = 14;
% title('C','FontSize',16);
% xlabel('time(s)','FontSize',16)
% ylabel('Volts','FontSize',16)
% 
% subplot(2,2,4);
% plot(emgTime,filtEMG(4,:),'Color','k');
% ylim(ylimits);
% xlim(xlimits);
% ax = gca;
% ax.FontSize = 14;
% title('D','FontSize',16);
% xlabel('time(s)','FontSize',16)
% ylabel('Volts','FontSize',16)
% 
% 
% A = length(find(emgTime<ii));
% B = length(find(emgTime<jj));
% max(filtEMG(1,A:B))