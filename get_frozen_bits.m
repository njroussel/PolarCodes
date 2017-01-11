function frozen_bits = get_frozen_bits(N, k_indices)
%GET_FROZEN_BITS Summary of this function goes here
%   Detailed explanation goes here

frozen_bits = zeros(1,N);
frozen_bits(k_indices) = -1;

disp('The frozen bits are:');
disp(frozen_bits);
end

