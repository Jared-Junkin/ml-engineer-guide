


% Generate 100 random observations from a standard normal distribution
observations = randn(100, 1);

% Define points at which to evaluate the KDE
x = [0.2, -1.0, 0.5]; % Example points

% Call the gaussian_kde_plot function
gaussian_kde(observations, x);


function gaussian_kde(observations, x)
    % Gaussian Kernel Density Estimation and Plot

    % Define bandwidth using Silverman's rule of thumb
    n = length(observations);
    bandwidth = 1.06 * std(observations) * n^(-1/5);
    
    % Define points for evaluating the KDE
    x_values = linspace(min(observations), max(observations), 1000);
    
    % Initialize KDE values
    kde_values = zeros(size(x_values));
    
    % Calculate KDE % THIS LINE IS JUST FOR GENERATING THE GRAPH. The
    % actual KDE analysis happens on the line below evaluate kde at x
    for i = 1:length(x_values)
        kde_values(i) = sum(1/(sqrt(2*pi)*bandwidth) * exp(-0.5*((x_values(i) - observations)/bandwidth).^2)) / n; %
    end
    
    % Evaluate KDE at x (where the magic happens)
    kde_x = sum(1/(sqrt(2*pi)*bandwidth) * exp(-0.5*((x - observations)/bandwidth).^2)) / n;
    
    % Plotting
    figure;
    plot(x_values, kde_values, 'LineWidth', 2);
    xlabel('Observation');
    ylabel('Estimated Probability Density');
    title(sprintf('Gaussian KDE - Estimated Density at x: %f', kde_x));
    hold on;
    
    % Mark the points in x on the density curve
    y_values_for_x = sum(1/(sqrt(2*pi)*bandwidth) * exp(-0.5*((x - observations)/bandwidth).^2)) / n;
    plot(x, y_values_for_x, 'ro'); % 'ro' plots x points in red circles
    hold off;
end


