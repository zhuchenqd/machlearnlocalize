function [zBPF] = filtered_noise()

%TO DO: Set signal array dimension

%Summary: Generates and samples Gaussian White Noise, then passes that
%signal through a RRC Bandpass Filter. The received filtered signal will be
%used in the preprocessing function.

%CONSTANTS
%Two-sided power spectral density (dBm/MHz)
N = -108.93/2;

%Generate White Gaussian Noise
z = wgn(1,2*4000, N, 'dBm');

S = fft(z);

%RRC Bandpass Filter
%Impulse Response
x = 0:7999;

    function b = bandpass(x)
        b = rectangularPulse((x-4492)/799);
    end

h = @bandpass;

H = feval(h, x);

G = S.*H;
g = ifft(G);

zBPF = g;
%length(zBPF) = 8000


end
