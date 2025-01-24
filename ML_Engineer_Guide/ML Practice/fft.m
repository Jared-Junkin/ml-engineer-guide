% Parameters
Fs = 4000;            % Sampling rate in Hz
T = 1/Fs;             % Sampling period
L = 1000;             % Length of signal
t = (0:L-1)*T;        % Time vector

% Signal
f = 50;               % Frequency of the sine wave in Hz
signal = sin(2*pi*f*t);

% Fourier Transform
Y = fft(signal);

% Compute the two-sided spectrum and then the single-sided spectrum
P2 = abs(Y/L);        % Two-sided spectrum P2
P1 = P2(1:L/2+1);     % Single-sided spectrum P1
P1(2:end-1) = 2*P1(2:end-1);

% Frequency vector
f = Fs*(0:(L/2))/L;

% Plot the single-sided amplitude spectrum
figure;
plot(f, P1);
title('Single-Sided Amplitude Spectrum of sin(t)');
xlabel('Frequency (f) in Hz');
ylabel('|P1(f)|');
