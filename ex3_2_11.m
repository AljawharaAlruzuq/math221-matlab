% Exercise 3.2 #11 (Burden & Faires 9th ed., page 124)
% f(x) = 1/(1+x^2) on [-5,5]. For n = 1..10: h = 10/n, nodes x_j = -5 + j*h,
% y_n = P_n(1 + sqrt(10)) using Neville's method. Does y_n converge?
clc; clear; format long
f  = @(x) 1./(1 + x.^2);
xq = 1 + sqrt(10);
actual = f(xq);

fprintf('  n     h          y_n = P_n(1+sqrt(10))    |error|\n');
y = zeros(1,10);
for n = 1:10
    h = 10/n;
    x = -5 + (0:n)*h;
    y(n) = neville(x, f(x), xq);
    fprintf('%3d   %.4f    %12.6f              %.6f\n', n, h, y(n), abs(y(n) - actual));
end
fprintf('\nActual f(1+sqrt(10)) = %.7f\n', actual);
fprintf('Answer key (page 783): 0.038462, 0.333671, 0.116605, -0.371760, -0.0548919,\n');
fprintf('                       0.605935, 0.190249, -0.513353, -0.0668173, 0.448335\n');
fprintf('The values jump around and do not approach %.7f, so {y_n} does not converge.\n', actual);

% Neville table for n = 4 (to show the method step by step)
x4 = -5 + (0:4)*2.5;
[P4, Q4] = neville(x4, f(x4), xq);
disp('Neville table Q(i,j) for n = 4:'); disp(Q4)

% Plot f(x) and P_10(x): Runge's phenomenon
xx = linspace(-5, 5, 401);
x10 = -5 + (0:10);
P10 = zeros(size(xx));
for k = 1:numel(xx)
    P10(k) = neville(x10, f(x10), xx(k));
end
figure; plot(xx, f(xx), 'b', 'LineWidth', 1.5); hold on; grid on
plot(xx, P10, 'r--', 'LineWidth', 1.2);
plot(x10, f(x10), 'ko', 'MarkerFaceColor', 'k');
plot(xq, actual, 'gs', 'MarkerFaceColor', 'g', 'MarkerSize', 8);
plot(xq, y(10), 'rs', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
title('Ex 3.2 #11: f(x) = 1/(1+x^2) vs P_{10}(x)  (Runge''s phenomenon)');
xlabel('x'); ylabel('y');
legend('f(x)', 'P_{10}(x)', 'nodes', 'f(1+\surd10)', 'P_{10}(1+\surd10)', 'Location', 'south');
