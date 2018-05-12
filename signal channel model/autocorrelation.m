function [rPhi] = autocorrelation()
% Summary: Generates the autocorrelation function of r(t)

W = 2*499.2 * 10^6; % Bandwidth (Hz)
global datalength;

% Sampling
Fs = 2 * W;                                          % Sampling frequency
t = (-datalength/2):((1/Fs)*10^9):(datalength/2);    % Time vector 

% Autocorrelation function
y = sinc(t/2)*((cos(pi*0.6*t/2))/((1-(0.6*t)).^2))*cos(2*pi*t*4492.8*10^6);

rPhi = y;

end
