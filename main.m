% Example script which plots the block error probability as function of
% rate. 

clear;
clc;

% Configuration
N = 256; 
p_erasure = 0.4;
num_simulations_per_rate = 10;
num_rates_simulated = 10;

rates = linspace(1/4, 1 - p_erasure, num_rates_simulated + 1);
rates = rates(2:end);

success_rates = zeros(1, num_rates_simulated);

for i = 1:num_rates_simulated
    count = 0;
    rate = rates(i);
    for j = 1:num_simulations_per_rate
        count = count + simulate(N, rate, p_erasure);
    end
    success_rates(i) = count / num_simulations_per_rate;
end

clc;


figure % opens new figure window
block_error_probabilites = 1 - success_rates;
plot(rates, block_error_probabilites, '-o','MarkerIndices', 1:1)
title('Block error probability as a function of rate')
ylabel('Block error probability')
xlabel('Rate')