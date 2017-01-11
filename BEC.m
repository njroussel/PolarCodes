function observation = BEC(p_erasure, code_word)
%BEC Summary of this function goes here
%   Detailed explanation goes here

observation = code_word;
p_erasures = rand(1,length(code_word));
for i = 1:length(code_word)
    if p_erasures(i) < p_erasure
        observation(i) = -1;
    end
end

disp('The observed output of the channel is:');
disp(observation);
end

