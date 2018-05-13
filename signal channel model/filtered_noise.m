function [zBPF] = filtered_noise()

% TO DO: Set signal array dimension

% Summary: Generates and samples Gaussian White Noise, then passes that
% signal through a RRC Bandpass Filter. The received filtered signal will be
% used in the preprocessing function.

% CONSTANTS
% Two-sided power spectral density (dBm/MHz)
N = -108.93/2;
% Data vector length
global datalength;
l = datalength;

% Generate White Gaussian Noise
z = wgn(1,l, N, 'dBm');

% Generate Fourier transformed of White Gaussian Noise.
S = fft(z);

% RRC Bandpass Filter
% Impulse Response

% row Vector counting up from one to l.
x = 0:(l-1); 
    
    function b = bandpass(x)  
 
% Summary: Generates Bandpass for inputted Vector using rectangularPulse 
% function.

        b = rectangularPulse((x-4492)/799);
    end

% Create function handle for Bandpass and evalutate it using the vector x.

h = @bandpass;
H = feval(h, x);

% Do the Operation in frequency domain for simplicity.
% Using componentwise multiplication of fourier transformed White Gaussian
% Noise and transfer function the filtered Noise is obtained. Then transform
% back to time domain.

G = S.*H;
g = ifft(G);

% Set zBPF.
zBPF = g;


end
