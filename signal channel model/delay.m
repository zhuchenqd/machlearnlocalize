function [ delayed ] = delay( input, A)
% Summary:  Shifts an array with values by A to the right and fills the
% remaining elements with zeros. The vector does NOT grow correspondingly.
% Input:    Input vector, Shift time
% Output:   Delayed input vector
% IMPORTANT: A cannot be larger than the size of input.

l = length(input);

% Round input to nearest integer: Only shifts of whole nanoseconds allowed

delta = round(A);

% If delta is larger than the size of the data vector, the data vector is zero.

if (A > l)
    delayed = zeros(1,l);
else
    % Shift input circularly

    delayed = circshift(input, delta);

    % Set data before initial first element to zero

    for k=1:delta
       delayed(k) = 0; 
    end

end

