x = linspace(-2, 2, 1000);
Phi = @(x) 0.5 * (1 + erf(x / sqrt(2)));
gelu = @(x) x .* Phi(x);
figure();
plot(x, gelu(x));
xlabel('x');
ylabel('GeLU(x)');
title('GeLU Activation Function');
grid on;
