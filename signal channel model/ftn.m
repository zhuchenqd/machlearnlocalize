function [matr] = ftn(arr, n)
% Summary: Generates matrix from row vector arr in which the nth column is
% the n-delayed version of arr.

% CONSTANTS
global Tc;

sprintf('%d', n);
sprintf('%d', length(arr));
sprintf('%d', n*Tc);

l = length(arr);

% Initialize matrix
% Remark: If n is bigger than the array length, the row vectors after
% length(arr) will be entirely zero.

matr = zeros(n,l);

    for k = 1:n
        if (k*Tc > l)
            matr(k:n,:) = zeros(n-k+1,l);
            break;
        end
        matr(k,:) = delay(arr, k*Tc);
    end

end
