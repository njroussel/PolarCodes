function structure = create_structure(N, frozen_bits, observation)
% Creates the structure (Graphical model) where the first layer are the
% frozen bits (frozen_bits) and the last layer are the observed values from
% the channel (observation). N is the code block size.

% Check if N is valid
[f, e] = log2(N);
if f ~= 0.5
    error('N was not a power of 2!');
end
n = e - 1;

structure = NaN(N, n + 1);

structure(:,1) = frozen_bits;
structure(:,n + 1) = observation;

end

