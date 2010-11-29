function plot_ellipse_implicit(p)

    % ax^2 + by^2 + cxy + dx + ey + f = 0;

    a = p(1);
    b = p(3)/2;
    c = p(2);
    d = p(4)/2;
    f = p(5)/2;
    g = p(6);
    x0 = (c*d - b*f)/(b^2-a*c);
    y0 = (a*f - b*d)/(b^2-a*c);
    xc = [x0 y0]

    ff = p(1)*x0^2 + p(2)*y0^2 + p(3)*x0*y0 + p(4)*x0 + p(5)*y0 + p(6);
    p = p/(-ff);
    p

    A = [p(1) p(3)/2; p(3)/2 p(2)];

    [x,e] = eig(inv(A))
    r = 1 ./ sqrt(diag(e))

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
     h = plot(x(1,:), x(2,:));

