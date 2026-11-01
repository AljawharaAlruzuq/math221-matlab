% Exercise 2.3 #13 (Burden & Faires 9th ed., page 76)
% Find the point on y = x^2 closest to (1, 0), to within 1e-4, using Newton's method.
% d(x)^2 = (x - 1)^2 + (x^2 - 0)^2 = (x - 1)^2 + x^4
% Minimum where the derivative is 0:  f(x) = 2(x - 1) + 4x^3 = 4x^3 + 2x - 2 = 0
clc; clear; format long
f  = @(x) 4*x.^3 + 2*x - 2;
df = @(x) 12*x.^2 + 2;

[p, n, T] = newton(f, df, 1, 1e-4, 50);
fprintf('  n        p_n            |p_n - p_(n-1)|\n');
for i = 1:size(T,1)
    if i == 1, d = NaN; else, d = abs(T(i,2) - T(i-1,2)); end
    fprintf('%3d   %.9f   %.9f\n', T(i,1), T(i,2), d);
end
fprintf('\nx = p%d = %.6f, closest point = (%.6f, %.6f)\n', n, p, p, p^2);
fprintf('Answer key (page 779): p5 = 0.589755, point (0.589755, 0.347811)\n');

% Plot
xx = linspace(-0.5, 1.5, 300);
figure; plot(xx, xx.^2, 'b', 'LineWidth', 1.5); hold on; grid on; axis equal
plot(1, 0, 'ks', 'MarkerFaceColor', 'k');
plot(p, p^2, 'ro', 'MarkerFaceColor', 'r');
plot([1 p], [0 p^2], 'r--');
title('Ex 2.3 #13: closest point on y = x^2 to (1, 0)'); xlabel('x'); ylabel('y');
legend('y = x^2', '(1, 0)', 'closest point', 'shortest distance', 'Location', 'northwest');

% Comparison: Secant method on the same f(x)
p0 = 1; p1 = 0.5;                 % two starting guesses
k = 1;
fprintf('\nSecant method (p0 = 1, p1 = 0.5):\n  n        p_n\n');
while true
    p = p1 - f(p1)*(p1 - p0)/(f(p1) - f(p0));
    k = k + 1;
    fprintf('%3d   %.9f\n', k, p);
    if abs(p - p1) < 1e-4, break; end
    p0 = p1; p1 = p;
end
fprintf('\nNewton: x = %.6f in %d iterations\n', T(end,2), size(T,1)-1);
fprintf('Secant: x = %.6f in %d iterations\n', p, k-1);
