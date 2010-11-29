%PLOT_POINT	Mark point features
%
%   plot_point(p, options)
%
%  Options:
%    'textcolor', colspec     Specify color of text
%    'textsize', size         Specify size of text
%    'printf', {fmt, data}    Label points according to printf format
%                              string and corresponding element of data
%    'sequence'               Label points sequentially

function plot_point(p, varargin)

    opt.textcolor = 'g';
    opt.textsize = 12;
    opt.printf = [];
    opt.sequence = false;
    opt.bold = false;

    [opt,arglist] = tb_optparse(opt, varargin);

    % default marker style
    if isempty(arglist)
        arglist = {'sb'};
    end

    % add stuff to pull .u and .v out of a vector of objects
    if ~isnumeric(p) && any(strcmp('u_', properties(p)))
        % p is an object with u_ and v_ properties
        p = [[p.u_]; [p.v_]];
    end

    ish = ishold();
	hold on
	for i=1:numcols(p)
		plot(p(1,i), p(2,i), arglist{:});
        if opt.sequence
            show(p(:,i), '%d', i, opt);
        end

        if ~isempty(opt.printf)
            show(p(:,i), opt.printf{1}, opt.printf{2}(i), opt);
        end

	end
    if ~ish
        hold off
    end
    figure(gcf)
end

function show(p, fmt, val, opt)
    if opt.bold
        fw = 'bold';
    else
        fw = 'normal';
    end
    text(p(1), p(2), sprintf([' ' fmt], val), ...
        'HorizontalAlignment', 'left', ...
        'VerticalAlignment', 'middle', ...
        'FontUnits', 'pixels', ...
        'FontSize', opt.textsize, ...
        'FontWeight', fw, ...
        'Color', opt.textcolor);
end
