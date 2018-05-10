function [rPhi] = autocorrelation()
%Summary: Generates the autocorrelation function of r(t)

W = 2*499.2 * 10^6; % Bandwidth (Hz)

%Sampling
Fs = 2 * W;                                     % Sampling frequency
t = (-200000):((1/Fs)*10^9):(200000);           % Time vector 
L = length(t);                                  % Signal length

%Autocorrelation function
y = sinc(t/2)*((cos(pi*0.6*t/2))/((1-(0.6*t)).^2))*cos(2*pi*t*4492.8*10^6);

rPhi = y;

end