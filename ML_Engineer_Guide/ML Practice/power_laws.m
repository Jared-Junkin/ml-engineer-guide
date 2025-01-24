% Define parameters for the relationships
Nc = 8.8e13; % Characteristic number of non-embedding parameters
alpha_N = 0.076;

Dc = 5.4e13; % Characteristic dataset size
alpha_D = 0.095;

Cmin = 3.1e8; % Optimal compute budget in PF-days
alpha_C_min = 0.050;

% Define ranges for N, D, C
N = logspace(10, 14, 100); % Range for non-embedding parameters
D = logspace(10, 14, 100); % Range for dataset sizes
C = logspace(7, 10, 100);  % Range for compute budgets

% Calculate loss for each relationship
L_N = (Nc ./ N) .^ alpha_N;
L_D = (Dc ./ D) .^ alpha_D;
L_C = (Cmin ./ C) .^ alpha_C_min;

% Create the plots
figure;

% Plot for L(N)
subplot(3, 1, 1);
loglog(N, L_N, 'b', 'LineWidth', 2);
title('Loss as a Function of N');
xlabel('Number of Parameters N');
ylabel('Loss L(N)');
grid on;

% Plot for L(D)
subplot(3, 1, 2);
loglog(D, L_D, 'r', 'LineWidth', 2);
title('Loss as a Function of D');
xlabel('Dataset Size D (tokens)');
ylabel('Loss L(D)');
grid on;

% Plot for L(Cmin)
subplot(3, 1, 3);
loglog(C, L_C, 'g', 'LineWidth', 2);
title('Loss as a Function of C_{min}');
xlabel('Compute Budget C_{min} (PF-days)');
ylabel('Loss L(C_{min})');
grid on;

% Adjust layout
tight_layout();
