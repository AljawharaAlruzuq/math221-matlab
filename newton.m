function [p, n, tbl] = newton(f, df, p0, TOL, N0)
% NEWTON  Algorithm 2.3 (Burden & Faires): Newton's method.
%   p_n = p_{n-1} - f(p_{n-1}) / f'(p_{n-1})
tbl = [0 p0];
for i = 1:N0
    p = p0 - f(p0)/df(p0);
    tbl(end+1,:) = [i p]; %#ok<AGROW>
    if abs(p - p0) < TOL
        n = i; return
    end
    p0 = p;
end
n = N0;
warning('Method failed after %d iterations.', N0);
end
