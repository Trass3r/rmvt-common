%plot_ellipse Plot an ellipse
%
%   plot_ellipse(A, xc, ls)
%
%   ls is the standard line styles.

function h = plot_ellipse(A, xc, varargin)

    if size(A,1) ~= size(A,2)
        error('ellipse is defined by a square matrix');
    end
    
    if nargin < 2
        xc = zeros(1, size(A,1));
    end
    if nargin < 3
        varargin = {};
    end
            
    if size(A,1) == 3
        % plot an ellipsoid
        plot_ellipsoid(inv(A), xc, varargin{:});
    else
        % plot an ellipse

        if(~any(diag(A)==0))
            [V,D] = eig(A);
            
            % make unit circle
            th = [0:0.1:2*pi];
            th = [th 0];
            y = [cos(th);sin(th)];
            
            % warp it into the ellipse
            x = inv(sqrtm(A))*y;
            %el = V*sqrtm(D)*y;
            % offset it
            x = x + repmat(xc(:), 1, size(x,2));
            %        el = [el el(:,1)] + repmat(x,1,size(el,2)+1);
            h = plot(x(1,:), x(2,:), varargin{:} );
            
        end
    end
end
