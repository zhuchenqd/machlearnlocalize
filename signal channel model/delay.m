function [ delayed ] = delay( input, A)
% Summary:  Shifts an array with values by A to the right and fills the
% remaining elements with zeros. The vector grows correspondingly.
% IMPORTANT: A cannot be larger than the size of input.

l = length(input);

% Round input to nearest integer: Only shifts of whole nanoseconds allowed
delta = round(A);

% Extract tail from end - delay to end of input array.
tail = input(end-delta+1:end);

% Special case: If delay is one, set tail to last element of input
% vector.

if (delta==1)
    tail = input(end);
end

% Shift the input array delta indices to the right.
% The elements at the end of input array are lost, but are stored in tail
% vector.

for k = 0:(l-1-delta)
    input(l - k) = input(l - k - delta);
end

% Fill out the obsolete indices at the left side of array with
% zeros.

for j = 1:delta
    input(j) = 0;
end

% The delayed array is won by putting input and tail array together.

delayed = cat(2, input, tail);

end

