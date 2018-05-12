function [y] = energy_detector(rBPF)
% Summary: 


% CONSTANTS

global NSync;
global Nc;
global Tc;

% Preamble symbol duration (ns)
Tpsym = 3974;


% Initialize NSync x Nc energy matrix Y

Y = zeros(Nc, NSync);

% Function |rBPF|^2

integrand = (abs(rBPF)).^2;

% Fill Y with calculated data

for i = 1:NSync
    for j = 1:Nc
        % Calculate integration time interval
        tmin = (i-1)*Tpsym + (j-1)*Tc;
        tmax = 
    end
end




end
