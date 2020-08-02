%% Select CMAPs
%
% This is a script that can be used to select the CMAPs
% which were properly aligned by CMAP_prepare.
%
% Sometimes there will be double-peaks, or motion artifacts,
% and this script allows you to select the CMAPs for your final matrix
% and plot them.
% 
% To make this process straightforward (and to eliminate any guess work) I
% suggest you use the align_CMAPs script beforehand to determine with accuracy which
% CMAPs are aligned and which ones out of the bunch are off-kilter.
%
% Updated 2020-07-30 by Alexis L. Lowe
%
%%

c = zeros(18,length(CMAP),3);
c(1:2,:,:) = CMAP(1:2,:,:);
c(3,:,:) = CMAP(5,:,:);
c(4,:,:) = CMAP(11,:,:);
c(5:6,:,:) = CMAP(13:14,:,:);
c(7:8,:,:) = CMAP(16:17,:,:);
c(9:10,:,:) = CMAP(19:20,:,:);
c(11,:,:) = CMAP(23,:,:);
c(12:13,:,:) = CMAP(25:26,:,:);
c(14,:,:) = CMAP(29,:,:);
c(15,:,:) = CMAP(31,:,:);
c(16:18,:,:) = CMAP(37:39,:,:);
% c(20,:,:) = CMAP(38,:,:);

CMAP = c;

plot_CMAPs(emgTime(1,1:length(CMAP)),CMAP)
