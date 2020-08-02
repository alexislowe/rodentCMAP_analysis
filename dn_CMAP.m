%% Plotting overlaid CMAPs for Muscle Tissues - Peroneal Nerve Only (DN)
%
% This is the script that I used to make overlaid plots of the average CMAP
% signals from each of the animals in a particular surgical group.
% 
% I particularly used this script for plotting CMAPs of muscle that were
% only stimulated by the peroneal (denervated sciatic).
%
% There is a similar script called intact_CMAP that is used to plot
% overlaid averages from animals with intact sciatic nerves.
%
% Finally, the bigav_CMAP and smallav_CMAP scripts can be used to take
% averages across animals and within surgical groups. (In other words, take
% averages without separating individual animals.)
%
% Updated 2020-07-30 by Alexis L. Lowe
%
%%

clear all;
figure;

a = 'VDMT25-L-DN-20';
b = 'VDMT25-L-DN-30';
c = 'VDMT25-L-DN-50';
d = 'VDMT25-R-DN-50';
e = 'VDMT29-L-DN-100';
f = 'VDMT29-R-DN-50';
g = 'VDMT30-L-DN-80';
h = 'VDMT30-R-DN-50';
group = 'VDMT - Peroneal Only';

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

naivedn = naive*1000;
errordn = error*1000;


n = 1;
naivebar1 = shadedErrorBar(time,naivedn(n,:),errordn(n,:),'lineProps','k');
hold on;
n = 2;
naivebar2 = shadedErrorBar(time,naivedn(n,:),errordn(n,:),'lineProps','b');
hold on;
n = 3;
naivebar3 = shadedErrorBar(time,naivedn(n,:),errordn(n,:),'lineProps','g');
hold on;
n = 4;
naivebar4 = shadedErrorBar(time,naivedn(n,:),errordn(n,:),'lineProps','c');
hold on;
n = 5;
naivebar5 = shadedErrorBar(time,naivedn(n,:),errordn(n,:),'lineProps','r');
hold on;
n = 6;
naivebar6 = shadedErrorBar(time,naivedn(n,:),errordn(n,:),'lineProps','y');
n = 7;
naivebar7 = shadedErrorBar(time,naivedn(n,:),errordn(n,:),'lineProps','k');
hold on;
n = 8;
naivebar8 = shadedErrorBar(time,naivedn(n,:),errordn(n,:),'lineProps','m');

ylim([-6,6]);
xlim([0,100]);
ax = gca;
ax.FontSize = 14;
title(group,'FontSize',16);
xlabel('time(ms)','FontSize',16)
ylabel('milliVolts','FontSize',16)
legend(a,b,c,d,e,f,g,h)
%legend(c,d,f,h)