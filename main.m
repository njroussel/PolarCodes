% Clear variables and command window
clear;
clc;

% Configuration
N = 8;
R = 0.5;
p_erasure = 0.25;

% Compute indices
k_indices = get_indices(N, p_erasure, R);
disp(' ');

% Get a random word
word = pick_word(floor(R*N));

% Encode word
code_word = encode(word, N, k_indices);

% Pass code word through channel
observation = BEC(p_erasure, code_word);

frozen_bits = get_frozen_bits(N, k_indices);

structure = create_structure(N, frozen_bits, observation);