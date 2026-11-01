function [p, n, tbl] = fixed_point(g, p0, TOL, N0)
% FIXED_POINT  Algorithm 2.2 (Burden & Faires): solve p = g(p).
%   [p, n, tbl] = fixed_point(g, p0, TOL, N0)
%   g   : function handle, e.g. @(x) 0.5*sqrt(10 - x.^3)
%   p0  : initial approximation
%   TOL : tolerance on |p - p0|
%   N0  : maximum number of iterations
tbl = [0 p0];
i = 1;
while i <= N0
    p = g(p0);
    tbl(end+1,:) = [i p]; %#ok<AGROW>
    if ~isreal(p) || ~isfinite(p)
        warning('Iteration %d gave %s: method fails.', i, num2str(p));
        n = i; return
    end
    if abs(p - p0) < TOL
        n = i; return
    end
    i = i + 1;
    p0 = p;
end
n = N0;
warning('Method failed after %d iterations.', N0);
end
