function [ delayed ] = delay( input, A)
% Summary:  Shifts an array with values by A to the right and fills the
% remaining elements with zeros. The vector grows correspondingly.
% IMPORTANT: A cannot be larger than the size of input.

l = length(input);

% Round input to nearest integer: Only shifts of whole nanoseconds allowed
delta = round(A);

tail = input(end-delta+1:end);

if (delta==1)
    tail = input(end);
end


for k = 0:(l-1-delta)
    input(l - k) = input(l - k - delta);
end

for j = 1:delta
    input(j) = 0;
end

    
delayed = cat(2, input, tail);

end

