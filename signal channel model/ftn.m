function [matr] = ftn(arr, n)
% Summary: Generates matrix from row vector arr in which the nth column is
% the n-delayed version of arr.

% CONSTANTS
global Tc;

sprintf('%d', n)
sprintf('%d', length(arr))
sprintf('%d', n*Tc)

matr = zeros(n,length(arr) + n*Tc);
sprintf('%d', length(matr))
sprintf('%d', length(delay(arr, n*Tc)))

    for k = 1:n
       matr(k,:) = cat(2, delay(arr, k*Tc), zeros(1, (n-k)*Tc));
    end

end
