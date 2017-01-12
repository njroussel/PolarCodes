function out_structure = forward_propagate(structure)
%FORWARD_PROPAGATE Summary of this function goes here
%   Detailed explanation goes here

out_structure = structure;
[N, n_plus_one] = size(structure);
n = n_plus_one - 1;

    function blocks = separate_blocks(column, structure)
        col = structure(:,column);
        block_size = 2.^column;
        blocks = reshape(col, block_size, -1);
    end


out_structure




end

