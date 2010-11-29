function h = plot(p1, varargin)

    if length(varargin) == 0
        varargin = {'bx'};
    end

    if numrows(p1) == 3,
        hh = plot3(p1(1,:), p1(2,:), p1(3,:), varargin{:});
        xyzlabel
    else
        hh = plot(p1(1,:), p1(2,:), varargin{:});
        xlabel('x');
        ylabel('y');
    end
    if nargout == 1,
        h = hh;
    end
