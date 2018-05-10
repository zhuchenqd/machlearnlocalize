function [rBPF] = preprocessing(Rphi, zBPF)
% TO DO: Set L, alpha, tau, b as inputs received from SIM
% 
% Summary: Calculates and returns the filtered preamble symbol rBPF using the
% autocorrelation function Rphi and the filtered Gaussian white noise zBPF
% as well as other constants.

%CONSTANTS

%Parameters: TEST DATA randomly chosen
%Number of multipath components
L = 5;
%Complex amplitude of lth MPC
alpha = [3, 5.33, 6, 12, 4.9];
%Delay of lth MPC (ns)
tau = [180, 50, 70, 35.7, 64.8];
%NLOS bias (ns)
b = 7.519;

%Pulse energy (dBM*s)
Ep = -74.43;

%Center frequency (MHz)
global fc;
fc = 4492.8;

%Bandwidth (MHz)
global W;
W = 499.2;

%Number of symbols in SYNC sequence
NSync = 64;

%Number of chips per preamble symbol
Nc = 1984;

%All-one row vector with dimension NSync
Onevec = ones(1, NSync);

%Total number of chips per preamble 
Ntot = 64 * Nc;

%Ternary sequence
C = [-1,0,1,-1,0,0,1,1,1,-1,1,0,0,0,-1,1,0,1,1,1,0,-1,0,1,0,0,0,0,-1,0,0];

%Unit vector of length M = 64
delta64 = zeros(1,64); 
delta64(1,1) = 1;

%Preamble symbol
S = kron(C, delta64);

%CALCULATION

rBPF = zeros(1,2*4000);

%ERROR: Using Ntot in ftn leads to a total shift of 253952 ns, which is
%exceeds the maximum array size.
%Cannot assess whether cross product will be viable.

    for k = 1:L
        rBPF = rBPF + cross(alpha(k)*sqrt(Ep)*kron(Onevec, S), ftn(delay(Rphi, tau(k)+b), Ntot));
    end
    
%length(kron(Onevec, S)) = 126976

%Adjust vector lengths

rBPF = rBPF + zBPF;
    
end