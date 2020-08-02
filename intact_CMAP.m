%% Plotting overlaid CMAPs for Muscle Tissues - Intact Sciatic Nerve (INT)
%
% This is the script that I used to make overlaid plots of the average CMAP
% signals from each of the animals in a particular surgical group.
% 
% I particularly used this script for plotting CMAPs of muscle that were
% stimulated with an intact sciatic nerve.
%
% There is a similar script called dn_CMAP that is used to plot
% overlaid averages from animals with peroneal nerve intact only (denervated sciatic).
%
% Finally, the bigav_CMAP and smallav_CMAP scripts can be used to plot
% overlaid averages across animals and within surgical groups. 
% (In other words,take averages without separating individual animals.)
%
% Updated 2020-07-30 by Alexis L. Lowe
%
%%


clear all;

a = 'VDMT25-L-INT-30';
b = 'VDMT25-L-INT-40';
c = 'VDMT25-L-INT-50';
d = 'VDMT25-R-INT-50';
e = 'VDMT29-L-INT-100';
f = 'VDMT29-R-INT-50';
g = 'VDMT30-L-INT-80';
h = 'VDMT30-R-INT-50';
group = 'VDMT - Intact Sciatic';

time = (1:6104)/12.207;
naive = zeros(8,6104);
error = zeros(8,6104);

load(a);
naive(1,1:length(CMAP)) = mean(CMAP(:,:,1),1);
error(1,1:length(CMAP)) = std(CMAP(:,:,1),1);
load(b);
naive(2,1:length(CMAP)) = mean(CMAP(:,:,1),1);
error(2,1:length(CMAP)) = std(CMAP(:,:,1),1);
load(c);
naive(3,1:length(CMAP)) = mean(CMAP(:,:,1),1);
error(3,1:length(CMAP)) = std(CMAP(:,:,1),1);
load(d);
naive(4,1:length(CMAP)) = mean(CMAP(:,:,1),1);
error(4,1:length(CMAP)) = std(CMAP(:,:,1),1);
load(e);
naive(5,1:length(CMAP)) = mean(CMAP(:,:,1),1);
error(5,1:length(CMAP)) = std(CMAP(:,:,1),1);
load(f);
naive(6,1:length(CMAP)) = mean(CMAP(:,:,1),1);
error(6,1:length(CMAP)) = std(CMAP(:,:,1),1);
load(g);
naive(7,1:length(CMAP)) = mean(CMAP(:,:,1),1);
error(7,1:length(CMAP)) = std(CMAP(:,:,1),1);
load(h);
naive(8,1:length(CMAP)) = mean(CMAP(:,:,1),1);
error(8,1:length(CMAP)) = std(CMAP(:,:,1),1);

naiveint = naive*1000;
errorint = error*1000;


n = 1;
naivebar1 = shadedErrorBar(time,naiveint(n,:),errorint(n,:),'lineProps','k');
hold on;
n = 2;
naivebar2 = shadedErrorBar(time,naiveint(n,:),errorint(n,:),'lineProps','b');
hold on;
n = 3;
naivebar3 = shadedErrorBar(time,naiveint(n,:),errorint(n,:),'lineProps','g');
hold on;
n = 4;
naivebar4 = shadedErrorBar(time,naiveint(n,:),errorint(n,:),'lineProps','c');
hold on;
n = 5;
naivebar5 = shadedErrorBar(time,naiveint(n,:),errorint(n,:),'lineProps','r');
hold on;
n = 6;
naivebar6 = shadedErrorBar(time,naiveint(n,:),errorint(n,:),'lineProps','y');
n = 7;
naivebar7 = shadedErrorBar(time,naiveint(n,:),errorint(n,:),'lineProps','k');
hold on;
n = 8;
naivebar8 = shadedErrorBar(time,naiveint(n,:),errorint(n,:),'lineProps','m');

ylim([-6,6]);
xlim([0,100]);
ax = gca;
ax.FontSize = 14;
title(group,'FontSize',16);
xlabel('time(ms)','FontSize',16)
ylabel('milliVolts','FontSize',16)
legend(a,b,c,d,e,f,g,h)
legend(c,d,f,h)