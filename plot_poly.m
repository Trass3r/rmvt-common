%PLOTPOLY Plot a polygon
%
%   plotpoly(p, args)
%
% p is 2D or 3D point data, one row per point.

% TODO: options for fill, not filled, line style, labels (cell array of strings)

function plot_poly(p, varargin)

    if numcols(p) < 3,
        error('too few points for a polygon');
    end

    opt.fill = [];
    opt.alpha = 1;

    [opt,arglist] = tb_optparse(opt, varargin);

    % default marker style
    if isempty(arglist)
        arglist = {'sb'};
    end

    ish = ishold();
	hold on

    x = [p(1,:) p(1,1)];
    y = [p(2,:) p(2,1)];
    if numrows(p) == 2,
        % plot 2D data
        if isempty(opt.fill)
            plot(x, y, arglist{:});
        else
            plot(x, y, arglist{:});
            h = patch(x', y', 0*y', 'FaceColor', opt.fill, ...
                'FaceAlpha', opt.alpha)
        end
    elseif numrows(p) == 3,
        % plot 3D data
        z = [p(3,:); p(3,1)];
        plot3(x, y, z, arglist{:});
        h = patch(x, y, z, 0*y, 'FaceColor', opt.fill, ...
            'FaceAlpha', opt.alpha)
    else
        error('point data must have 2 or 3 rows');
    end

    if ~ish
        hold off
    end
    figure(gcf)
