%plot_ellipse Plot an ellipse
%
%   plot_ellipse(J, xc, ls)
%
%   ls is the standard line styles.

function h = plot_ellipse(J, xc, varargin)

    if nargin < 2
        xc = [0 0];
    end

    plot_ellipse_inv(inv(J)/4, xc, varargin{:});

