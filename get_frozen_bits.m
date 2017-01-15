function frozen_bits = get_frozen_bits(N, k_indices)
% Creates the first layer of the graphical model - strucutre. It creates a
% N sized block where all indices are set to 0 except the k_indices which
% are erased (NaN values).

frozen_bits = zeros(1,N);
frozen_bits(k_indices) = NaN;

disp('The frozen bits are:');
disp(frozen_bits);
end

