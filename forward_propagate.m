function out_structure = forward_propagate(structure)
% Solves the strucutre (graphical model of polar code construction) from
% front to back.

out_structure = structure;
[~, n_plus_one] = size(structure);
n = n_plus_one - 1;

    function blocks = separate_blocks(column, structure)
        col = structure(:,column);
        block_size = 2.^(column - 1);
        blocks = reshape(col, block_size, []);
        if(column ~= 1)
            blocks = blocks.';
        end
    end

    function new_column = new_column(blocks)
        odds = blocks(1:2:end);
        evens = blocks(2:2:end);
        
        [one, two] = size(blocks);
        if(one ~= 1)
            odds = blocks(1:2:end, :);
            evens = blocks(2:2:end, :);
        end
        
        tops = mod(odds + evens, 2);
        bots = evens;
        new_column = ones(one, two);
        new_column(1:2:end) = tops;
        new_column(2:2:end) = bots;
        new_column = reshape(new_column.', [], 1);
    end
     
    function out_column = replace_column(old_column, new_column)
        [column_size, ~] = size(old_column);
        out_column = old_column;
        
        for j = 1:column_size
            if(~isnan(new_column(j)))
                out_column(j) = new_column(j);
            end
        end     
    end


for i = 1:n
    blocks = separate_blocks(i, out_structure);
    out_structure(:, i+1)  = replace_column(out_structure(:, i+1), new_column(blocks));
end

    

end

