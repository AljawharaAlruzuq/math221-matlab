% Exercise 2.3 #3(a) (Burden & Faires 9th ed., page 75)
% f(x) = x^2 - 6, p0 = 3, p1 = 2. Use the Secant method to find p3.
clc; clear; format long
f = @(x) x.^2 - 6;
p = zeros(1,4); p(1) = 3; p(2) = 2;      % p(1) = p0, p(2) = p1
for k = 3:4                               % computes p2 and p3
    p(k) = p(k-1) - f(p(k-1))*(p(k-1) - p(k-2)) / (f(p(k-1)) - f(p(k-2)));
end
fprintf('  n        p_n\n');
for k = 1:4
    fprintf('%3d   %.9f\n', k-1, p(k));
end
fprintf('\np3 = %.5f   (sqrt(6) = %.9f, error = %.6f)\n', p(4), sqrt(6), abs(p(4) - sqrt(6)));
fprintf('Answer key (page 779): 2.45454\n\n');

% Newton vs Secant on the same problem (p0 = 3 for Newton)
pn = 3;
for k = 1:2, pn = pn - f(pn)/(2*pn); end
fprintf('For comparison, Newton from p0 = 3 gives p2 = %.9f (error %.2e)\n', pn, abs(pn - sqrt(6)));
