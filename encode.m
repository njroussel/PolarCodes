function code_word = encode(word, N, k_indices)
% Encodes the binary word into N sized polard code block by using the
% indices provided in k_inidices.

% Check if N is valid
[f, e] = log2(N);
if f ~= 0.5
    error('N was not a power of 2!');
end

% Check if word and indices are valid
if length(word) ~= length(k_indices)
    error('Word was not the same length as indices!');
end

n = e - 1;

code_word = zeros(1, N);
code_word(k_indices) = word;

base_matrix = [1 1; 0 1];
encoding_matrix = base_matrix;
for i = 1:n-1
    encoding_matrix = kron(encoding_matrix, base_matrix);
end

code_word =  mod(encoding_matrix * code_word.', 2).';

disp('The code word is:');
disp(code_word);

end

