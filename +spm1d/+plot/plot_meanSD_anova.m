function [h0,h1] = plot_meanSD_anova(Y, c, varargin)
%__________________________________________________________________________
% Copyright (C) 2016 Todd Pataky
% $Id: plot_meanSD.m 1 2016-01-04 16:07 todd $

%parse inputs
parser         = inputParser;
addOptional(parser, 'linewidth', 2, @(x) isscalar(x));
addOptional(parser, 'facealpha', 0.25, @(x) isscalar && (x>=0) && (x<=1) );
addOptional(parser, 'color', 'k');
addOptional(parser, 'labels', string(unique(c)));
parser.parse(varargin{:});
linewidth      = parser.Results.linewidth;
facealpha      = parser.Results.facealpha;
colors         = parser.Results.color;
labels         = parser.Results.labels;

a = strcat('Y',string(unique(c)),'=Y(c==',string(unique(c)),',:);');
u_c = unique(c);

h0 = [];
h1 = [];
figure();clf();hold on;
for k = 1:length(a)
    eval(a(k));
    eval(strcat('Yp = Y',string(u_c(k)),';'));
    
    [y,ys]    = deal(mean(Yp,1), std(Yp,1));       
    x         = 0:numel(y)-1;
    if any(strcmp(varargin,'color'))
        h0    = [h0;plot(x, y,'color',colors{k},'linewidth',linewidth)];
    elseif length(a)>1
        h0    = [h0;plot(x, y,'linewidth',linewidth)];
    else
        h0    = [h0;plot(x, y,'color','k','linewidth',linewidth)];
    end
    h1        = [h1;spm1d.plot.plot_errorcloud(y, ys,'facecolor',h0(end).Color, 'facealpha',facealpha)];
end
legend(h0,labels);

