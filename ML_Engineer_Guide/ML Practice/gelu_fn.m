% Define x from -2 to 2 with 1000 points
x = linspace(-5,5, 1000);

% Define the Gaussian CDF and PDF for GeLU's gradient
Phi = @(x) 0.5 * (1 + erf(x / sqrt(2)));         % Gaussian CDF
phi = @(x) (1 / sqrt(2 * pi)) * exp(-0.5 * x.^2); % Gaussian PDF

% Define the gradients of ReLU and GeLU
grad_ReLU = @(x) x > 0; % ReLU gradient is 1 for x > 0, 0 otherwise
grad_GeLU = @(x) Phi(x) + x .* phi(x); % GeLU gradient

% Plot both gradients on the same graph
figure;
plot(x, grad_ReLU(x), 'b', 'DisplayName', 'ReLU Gradient');
hold on;
plot(x, grad_GeLU(x), 'r', 'DisplayName', 'GeLU Gradient');
xlabel('x');
ylabel('Gradient');
title('Gradients of ReLU and GeLU');
legend;
grid on;
hold off;
