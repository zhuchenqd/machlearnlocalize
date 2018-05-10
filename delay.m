function [ delayed ] = delay( input, A)
%Summary: shifts an array with values by A to the right and fills the
%remaining elements with zeros. The vector grows correspondingly.
%IMPORTANT: A cannot be larger than the size of input.

l = length(input);

    tail = input(end-A+1:end);

    if (A==1)
        tail = input(end);
    end

    
    for k = 0:(l-1-A)
        input(l - k) = input(l - k - A);
    end
    
    for j = 1:A
        input(j) = 0;
    end
    
    
    delayed = cat(2, input, tail);

end

