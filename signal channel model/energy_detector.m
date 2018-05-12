function [y] = energy_detector(rBPF)
% Summary: Calculates a row vector of sample energy averages by integrating
% over |rBPF|^2 with different time intervals.


% CONSTANTS

global NSync;
global Nc;
global Tc;

% Preamble symbol duration (ns)
Tpsym = 3974;

% Length of input vector
l = length(rBPF);

% Initialize NSync x Nc energy matrix Y

Y = zeros(NSync, Nc);

% Function |rBPF|^2

integrand = (abs(rBPF)).^2;

% Fill Y with calculated data

for i = 1:NSync
    for j = 1:Nc
        
        % Calculate integration time interval
        
        tmin = (i-1)*Tpsym + (j-1)*Tc;
        tmax = (i-1)*Tpsym + (j)*Tc;
        
        % Set minimum and maximum value for interval
        
        if (tmin == 0)
            tmin = 1;
        end
        
        if (tmax >= l)
            tmax = l;
        end
        
        % Cut integrand so only data points within time interval are
        % integrated
        
        cutintegrand = integrand(tmin:tmax);
        
        % Calculate integral of discrete data
        
        Q = trapz(cutintegrand);
        Y(i,j) = Q;
        
    end
end

% All-one row vector with dimension NSync
Onevec = ones(1, NSync);

% Calculate sample average
y = (1/NSync)*Onevec*Y;


end
