function [x] = percentile(Z, perc)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: flatten.m 1 2016-01-22 10:22 todd $


Z           = sort(Z);
n           = numel(Z);
nperc       = numel(perc);
ind         = floor(0.01 * perc * n);
ind(ind==0) = 1;
ind(ind==n) = n-1;
x           = zeros(1,nperc);
for i = 1:nperc
    x(i)    = mean( Z( ind(i) : ind(i)+1 ) );
end

