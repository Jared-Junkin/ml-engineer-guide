% Define the range for x
x = -10:0.1:10;

% Parameters for both distributions
mu = 0; % Mean

% Normal (Gaussian) Distribution (Low Kurtosis)
sigma_normal = 2; % Standard deviation of the normal distribution
pdf_normal = (1 / (sigma_normal * sqrt(2 * pi))) * exp(-0.5 * ((x - mu) / sigma_normal).^2);
kurtosis_normal = kurtosis(pdf_normal) - 3 + 3; % Correcting for MATLAB's excess kurtosis

% Laplace Distribution (High Kurtosis)
b_laplace = sqrt(1/2); % Scale parameter for Laplace to have same variance as the normal distribution
pdf_laplace = (1 / (2 * b_laplace)) * exp(-abs(x - mu) / b_laplace);
kurtosis_laplace = kurtosis(pdf_laplace) - 3 + 3; % Correcting for MATLAB's excess kurtosis

% Plotting
figure;
subplot(1,2,1); % Normal Distribution Plot
plot(x, pdf_normal, 'b-');
title(sprintf('Normal Distribution\nKurtosis = %.2f', kurtosis_normal));
xlabel('x'); ylabel('Probability Density');

subplot(1,2,2); % Laplace Distribution Plot
plot(x, pdf_laplace, 'r-');
title(sprintf('Laplace Distribution\nKurtosis = %.2f', kurtosis_laplace));
xlabel('x'); ylabel('Probability Density');
