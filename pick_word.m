function word = pick_word(k)
% Randomly generates a binary word of size k.

word = randi([0 1], 1, k);

str_out=['The ranomly generated word of size ',   num2str(k), ' is:'];
disp(str_out);
disp(word);
end

