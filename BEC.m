function observation = BEC(p_erasure, code_word)
% Simulates a binary erasure channel of p_ersaure erasure probability on a
% code word code_word.

observation = code_word;
p_erasures = rand(1,length(code_word));
for i = 1:length(code_word)
    if p_erasures(i) < p_erasure
        observation(i) = NaN;
    end
end

disp('The observed output of the channel is:');
disp(observation);
end

