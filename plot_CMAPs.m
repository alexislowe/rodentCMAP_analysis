%% PLOT a Matrix of Aligned CMAPs
% 
% 5 x Y SUBPLOT --  this shows each individual CMAP
%                   use this plot to determine if alignment was successful
%                   and which variables should be adjusted
%
% 3 x 1 SUBPLOT --  first figure = raw CMAPs aligned and overlaid
%                   second figure = absolute value of aligned CMAPs
%                   third figure = derivative of aligned CMAPs
%
% INPUTS:
%
% time = time signal, must be same length as CMAP
% CMAP = an n x Z x 3 array of aligned CMAPs
%	 n is the number of CMAPs
%	 Z is the number of samples
%
% 
% Updated 2020-07-30 by Alexis L. Lowe
%%

function plot_CMAPs(time,CMAP)

n = length(CMAP(:,1,1));
x = 1;

while x < (n+1)
    subplot(5,round(((n+2)/5),0),x);	% 5 x Y Subplot
    plot(CMAP(x,:,1));
    title(x);
    x = x+1;
end


figure;                                 % 3 x 1 Subplot
ax(1) = subplot(3,1,1);
plot(time,CMAP(:,:,1))
ylabel('Volts')

ax(2) = subplot(3,1,2);
plot(time,CMAP(:,:,2))
ylabel('Volts')

ax(3) = subplot(3,1,3);
plot(time,CMAP(:,:,3))
ylabel('V/sec')
xlabel('Time (s)')

linkaxes(ax,'x')

end
    