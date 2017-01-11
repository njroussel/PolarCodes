function structure = create_structure(N, frozen_bits, observation)
%CREATE_STRUCTURE Summary of this function goes here
%   Detailed explanation goes here

% Check if N is valid
[f, e] = log2(N);
if f ~= 0.5
    error('N was not a power of 2!');
end
n = e - 1;

structure = ones(N, n + 1);
structure = structure.* -1;

structure(:,1) = frozen_bits;
structure(:,n + 1) = observation;


disp(structure);
end

