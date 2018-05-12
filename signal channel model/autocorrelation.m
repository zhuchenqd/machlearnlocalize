function [rPhi] = autocorrelation()
% Summary:  Generates the autocorrelation function of r(t)
%           Function (7) on page 1359
%           Parameters taken from Table 1, page 1360
%           Output: rPhi for rBPF calculation


W = 499.2 * 10^6;                   % Bandwidth (Hz)

% Sampling

Fs = 2 * W;                         % Sampling frequency
incr = (1/Fs)*10^9;                 % Increment of t
tmax = 4000*incr;                   % Maximum t value
tmin = - (3999*incr);               % Minimum t value
t = (tmin):(incr):(tmax);           % Time vector 
L = length(t);                      % Signal length

% Autocorrelation function
% y calculation: All three factors are row vectors and are multiplied
% element wise
y = sinc(t/2).*((cos(pi*0.6*t/2))./((1-(0.6*t)).^2)).*cos(2*pi*t*4492.8*10^6);

rPhi = y;

end
