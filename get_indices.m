function k_indices = get_indices(N, p_erasure, R)
% GET_INDICES Computes the individual erasure probabilites for a polar code of block
% size N and rate R used on a BEC with erasure probabiliy p_erasure. 
% It then returns the k = floor(R * N) indices which have the smallest 
% erasure probabilites.

% Check if N is valid
[f, e] = log2(N);
if f ~= 0.5
    error('N was not a power of 2');
end

% Compute erasure probabilites
n = e - 1;
erasures = compute_p_erasures(n, p_erasure);

% Keep only the k = floor(R * N) lowest indices
[~, indices] = sort(erasures, 'ascend');
k_indices = indices(1: floor(R * N));

% Pretty print result
k_indices = sort(k_indices, 'ascend');

str_out = ['The indices to use for a block size of ', num2str(N), ', rate ', num2str(R),  ' and erasure probability ', num2str(p_erasure), ' are :'];
disp(str_out)

indices_out = '';
for i = 1:length(k_indices)
    if i == 1
        indices_out = num2str(k_indices(i) - 1);
    else
        indices_out =  [indices_out ', ' num2str(k_indices(i) - 1)];
    end
end
disp(indices_out)

end