function word = pick_word(k)
%PICK_WORD Summary of this function goes here
%   Detailed explanation goes here

word = randi([0 1], 1, k);

str_out=['The ranomly generated word of size ',   num2str(k), ' is:'];
disp(str_out);
disp(word);
end

