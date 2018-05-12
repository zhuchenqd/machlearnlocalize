% This script introduces and sets global data that is reused throughout the
% project. To be called at the beginning.

% Data vector length
% Roughly 2x preamble symbol duration
% 1 data point per ns
global datalength;
datalength = 8000;

% Pulse energy (dBM*s)
global Ep;
Ep = -74.43;

% Center frequency (MHz)
global fc;
fc = 4492.8;

% Bandwidth (MHz)
global W;
W = 499.2;

% Number of symbols in SYNC sequence
global NSync;
NSync= 64;

% Number of chips per preamble symbol
global Nc;
Nc = 1984;

% Chip duration
global Tc;
Tc = 2;