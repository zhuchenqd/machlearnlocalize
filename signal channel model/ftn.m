function [matr] = ftn(arr, n)
% Summary: Generates matrix from row vector arr in which the nth column is
% the n-delayed version of arr
% Input: Row vector to shift, Number of maximal shifts
% Output: The generated [n x(length(arr)+n*Tc)] matrix
% Tc: Chip duration taken from global_constants.m
% Attention: NOT WORKING because delay causes matrix to get too large

% Test ouputs
sprintf('%d', n)
sprintf('%d', length(arr))
sprintf('%d', n*Tc)


% Initializes a matrix of zeros, the number of rows equals the
% number of individual delays, the number of columns is the 
% size of the initial row vecotr plus the the maximum shift,
% so all the data can fit in the matrix (each column represets 
% on ns)

matr = zeros(n,length(arr) + n*Tc);

% Prints out test outputs

sprintf('%d', length(matr))
sprintf('%d', length(delay(arr, n*Tc)))

% Iterates through the rows of the resulting matrix
% 'matr(k,:)' Selectes the whole kth row
% 'cat(2,...)' Used to add two row vectors into one
%              The delayed signal is filled in and the row is
%              filled up with zeros

    for k = 1:n
       matr(k,:) = cat(2, delay(arr, k*Tc), zeros(1, (n-k)*Tc));
    end

end
