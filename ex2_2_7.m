% Exercise 2.2 #7 (Burden & Faires 9th ed., page 65)
% g(x) = pi + 0.5*sin(x/2) on [0, 2*pi], p0 = pi, accuracy 1e-2
clc; clear; format long
g  = @(x) pi + 0.5*sin(x/2);
dg = @(x) 0.25*cos(x/2);

% Theorem 2.3: g continuous, g maps [0,2pi] into itself, |g'(x)| <= k < 1
x = linspace(0, 2*pi, 1000);
fprintf('min g = %.6f, max g = %.6f  (inside [0, 2pi])\n', min(g(x)), max(g(x)));
k = max(abs(dg(x)));
fprintf('k = max|g''(x)| = %.4f < 1  => unique fixed point\n\n', k);

% Fixed-point iteration
[p, n, T] = fixed_point(g, pi, 1e-2, 50);
fprintf('  n        p_n            |p_n - p_(n-1)|\n');
for i = 1:size(T,1)
    if i == 1, d = NaN; else, d = abs(T(i,2) - T(i-1,2)); end
    fprintf('%3d   %.9f   %.6f\n', T(i,1), T(i,2), d);
end
fprintf('\nFixed point p = %.6f after %d iterations\n', p, n);
fprintf('Answer key (page 778): p3 = 3.626996\n\n');

% Corollary 2.5: |p_n - p| <= k^n/(1-k) * |p1 - p0| < 1e-2
p1 = g(pi);
nTheory = ceil(log(1e-2*(1-k)/abs(p1 - pi)) / log(k));
fprintf('Corollary 2.5 bound needs n >= %d, actual iterations needed = %d\n', nTheory, n);

% Plot
figure; plot(x, g(x), 'b', x, x, 'k--'); hold on; grid on
plot(p, p, 'ro', 'MarkerFaceColor', 'r');
title('Ex 2.2 #7: g(x) = \pi + 0.5 sin(x/2)'); xlabel('x'); ylabel('y');
legend('y = g(x)', 'y = x', 'fixed point', 'Location', 'northwest');
