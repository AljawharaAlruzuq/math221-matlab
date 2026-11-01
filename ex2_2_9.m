% Exercise 2.2 #9 (Burden & Faires 9th ed., page 65)
% Approximate sqrt(3) to within 1e-4 using fixed-point iteration
% Root of x^2 - 3 = 0  ->  x = 0.5*(x + 3/x) = g(x),  p0 = 1
clc; clear; format long
g = @(x) 0.5*(x + 3./x);

[p, n, T] = fixed_point(g, 1, 1e-4, 50);
fprintf('  n        p_n            |p_n - p_(n-1)|\n');
for i = 1:size(T,1)
    if i == 1, d = NaN; else, d = abs(T(i,2) - T(i-1,2)); end
    fprintf('%3d   %.9f   %.9f\n', T(i,1), T(i,2), d);
end
fprintf('\nsqrt(3) ~ p%d = %.5f   (actual sqrt(3) = %.9f)\n', n, p, sqrt(3));
fprintf('Answer key (page 778): p4 = 1.73205\n\n');

% Comparison asked in the exercise: Bisection (Section 2.1) on [1, 2]
f = @(x) x.^2 - 3; a = 1; b = 2; it = 0;
while (b - a)/2 >= 1e-4
    it = it + 1; m = (a + b)/2;
    if f(a)*f(m) < 0, b = m; else, a = m; end
end
fprintf('Bisection on [1,2]: %.5f after %d iterations\n', (a+b)/2, it);
fprintf('Fixed-point:        %.5f after %d iterations\n', p, n);
