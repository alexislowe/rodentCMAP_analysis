%% Determining which CMAPs in an array are actually aligned
%
% I like to use this script before using select_CMAPs.
% This script generates an array A that prints the peak of each CMAP as
% well as its index.
% I usually find the mode of A(:,2) and then select all the CMAPs whose
% maximum is at the same index.
%
% Updated 2020-07-30 by Alexis L. Lowe
%
%%

A = ones(40,3);
i = 1;
while i < 41
    [ampl, index] = max(CMAP(i,:,2));
    A(i,1) = i;
    A(i,2) = index;
    A(i,3) = ampl*(10^4);
    i = i + 1;
end