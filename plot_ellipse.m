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
        %% plot an ellipsoid

        % define mesh points on the surface of a unit sphere
        [Xs,Ys,Zs] = sphere();
        ps = [Xs(:) Ys(:) Zs(:)]';

        % warp it into the ellipsoid
        pe = sqrtm(A) * ps;

        % offset it to optional non-zero centre point
        if nargin > 1
            pe = bsxfun(@plus, xc(:), pe);
        end

        % put back to mesh format
        Xe = reshape(pe(1,:), size(Xs));
        Ye = reshape(pe(2,:), size(Ys));
        Ze = reshape(pe(3,:), size(Zs));

        % plot it
        h = mesh(Xe, Ye, Ze);

    else
        %% plot an ellipse

        [V,D] = eig(A);
        
        % define points on a unit circle
        th = linspace(0, 2*pi, 50);
        pc = [cos(th);sin(th)];
        
        % warp it into the ellipse
        pe = sqrtm(A)*pc;

        % offset it to optional non-zero centre point
        if nargin > 1
            pe = bsxfun(@plus, xc(:), pe);
        end

        % plot it
        h = plot(pe(1,:), pe(2,:), varargin{:} );
    end
end
