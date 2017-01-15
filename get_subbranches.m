function out_indices = get_subbranches(index)
% Returns for a given index (node) in the structure the two children nodes
% indices.
row = index(1);
col = index(2);

block_size = 2.^(col-1);
is_top = mod(ceil(row / block_size), 2);

if(is_top)
    out_index_top = [row, col + 1];
    out_index_bot = [row + block_size, col + 1];
else
    out_index_top = [row - block_size, col + 1];
    out_index_bot = [row, col + 1];    
end

out_indices = cat(1, out_index_top, out_index_bot);
end

