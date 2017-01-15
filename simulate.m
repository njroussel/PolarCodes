function success = simulate(N, R, p_erasure)
% Simulates a transmission of a random word with a polar code transmission
% scheme of block size N and rate R on a binary erasure channel of
% erasure probability p_erasure.
clc;

% Compute indices
k_indices = get_indices(N, p_erasure, R);
disp(' ');

% Get a random word
word = pick_word(floor(R*N));

% Encode word
code_word = encode(word, N, k_indices);

% Pass code word through channel
observation = BEC(p_erasure, code_word);

% Compute initial structure.
frozen_bits = get_frozen_bits(N, k_indices);
structure = create_structure(N, frozen_bits, observation);
disp('The initial structure is:');
disp(structure);

% Solve structure.
structure = forward_propagate(structure);
[~, n_plus_one] = size(structure);
 for i = 1:N
    tree = get_subtree([i 1], n_plus_one -1);
    structure = back_propagate(tree, structure);
    structure = forward_propagate(structure);
 end
 
 disp('The decoded structure is:');
 disp(structure);
 
 % Retrieve decoded word
 first_col = structure(:, 1);
 decoded_word = first_col(k_indices).';
 success = all(word == decoded_word);
end