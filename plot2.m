function h = plot2(p1, varargin)

    if ndims(p1) == 2
        if numcols(p1) == 3,
            hh = plot3(p1(:,1), p1(:,2), p1(:,3), varargin{:});
        else
            hh = plot(p1(:,1), p1(:,2), varargin{:});
        end
        if nargout == 1,
            h = hh;
        end
    else
        clf
        hold on
        for i=1:size(p1,2)
            plot2( squeeze(p1(:,i,:))' );
        end
    end
