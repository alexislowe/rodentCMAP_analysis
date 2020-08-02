%% Plotting overlaid CMAP Averages for Muscle Tissues - Avg across animals
%
% This is the script that I used to make overlaid plots of the average CMAP
% signals from each of the surgical groups, counting all the CMAPs from all
% the different animals as CMAPs in the group.
% 
% 
% Certain animals can be left out of the averaging by commenting out the
% letter for that animal. To make individual plots (rather than overlaying
% all the groups on one plot) use the smallav_CMAP script instead.
%
% Updated 2020-07-30 by Alexis L. Lowe
%
%%

clear all;

figure;
hold on;

group = 'Peroneal Nerve Only';

time = (1:6104)/12.207;
AMPL = zeros(160,6104);

a = 'VDMT25-L-DN-20';
b = 'VDMT25-L-DN-30';
c = 'VDMT25-L-DN-50';
d = 'VDMT25-R-DN-50';
e = 'VDMT29-L-DN-100';
f = 'VDMT29-R-DN-50';
g = 'VDMT30-L-DN-80';
h = 'VDMT30-R-DN-50';
group1 = 'VDMT-DN';
 
load(a);
AMPL(1:20,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

load(b);
AMPL(21:40,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

load(c);
AMPL(41:60,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

load(d);
AMPL(61:80,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

load(e);
AMPL(81:100,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

load(f);
AMPL(101:120,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

load(g);
AMPL(121:140,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

load(h);
AMPL(141:160,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

meanamp = mean(AMPL,1);
error = std(AMPL,1);

ampbar = shadedErrorBar(time,meanamp(1,:),error(1,:),'lineProps','r');

hold on;

a = 'RPNI11-L-DN-50';
b = 'RPNI11-R-DN-200';
c = 'RPNI12-L-DN-50';
d = 'RPNI12-R-DN-100';
e = 'RPNI15-L-DN-50';
f = 'RPNI15-L-DN-70';
g = 'RPNI15-R-DN-50';
h = 'RPNI15-R-DN-250';
group2 = 'RPNI-DN';

load(a);
AMPL(1:20,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

load(b);
AMPL(21:40,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

load(c);
AMPL(41:60,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

load(d);
AMPL(61:80,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

load(e);
AMPL(81:100,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

load(f);
AMPL(101:120,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

load(g);
AMPL(121:140,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

load(h);
AMPL(141:160,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

meanamp = mean(AMPL,1);
error = std(AMPL,1);

ampbar = shadedErrorBar(time,meanamp(1,:),error(1,:),'lineProps','g');

hold on;

a = 'BIM4-L-DN-500';
b = 'BIM4-R-DN-50';
c = 'BIM9-L-DN-300';
d = 'BIM9-R-DN-300';
e = 'BIM10-R-DN-50';
group3 = 'BIM-DN';
 
AMPL = zeros(100,6104);

load(a);
AMPL(1:20,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

load(b);
AMPL(21:40,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

load(c);
AMPL(41:60,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

load(d);
AMPL(61:80,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

load(e);
AMPL(81:100,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

meanamp = mean(AMPL,1);
error = std(AMPL,1);

ampbar = shadedErrorBar(time,meanamp(1,:),error(1,:),'lineProps','y');

hold on;

a = 'TO31-L-DN-50';
b = 'TO31-R-DN-50';
c = 'TO34-L-DN-50';
d = 'TO34-R-DN-50';
e = 'TO35-L-DN-50';
f = 'TO35-R-DN-50';
group4 = 'TO-DN';

AMPL = zeros(120,6104);

load(a);
AMPL(1:20,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

load(b);
AMPL(21:40,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

load(c);
AMPL(41:60,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

load(d);
AMPL(61:80,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

load(e);
AMPL(81:100,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

load(f);
AMPL(101:120,1:length(CMAP)) = CMAP(1:20,:,1)*1000;

meanamp = mean(AMPL,1);
error = std(AMPL,1);

ampbar = shadedErrorBar(time,meanamp(1,:),error(1,:),'lineProps','m');

ylim([-6,6]);
xlim([0,100]);
ax = gca;
ax.FontSize = 14;
title(group,'FontSize',16);
xlabel('time (ms)','FontSize',16)
ylabel('milliVolts','FontSize',16)

legend(group1,group2,group3,group4)