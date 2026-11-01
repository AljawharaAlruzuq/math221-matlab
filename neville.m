function [P, Q] = neville(x, y, xq)
% NEVILLE  Algorithm 3.1 (Burden & Faires): Neville's iterated interpolation.
%   x, y : data points (vectors of equal length)
%   xq   : point to interpolate at
%   P    : interpolated value Q(n,n)
%   Q    : full Neville table (lower triangular)
n = numel(x);
Q = zeros(n);
Q(:,1) = y(:);
for i = 2:n
    for j = 2:i
        Q(i,j) = ((xq - x(i-j+1))*Q(i,j-1) - (xq - x(i))*Q(i-1,j-1)) ...
                 / (x(i) - x(i-j+1));
    end
end
P = Q(n,n);
end
