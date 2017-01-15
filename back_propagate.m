function out_structure = back_propagate(tree, structure)
% Solves all the nodes in the tree from the deepest to the shallowest (back
% to front) and from top to bottom.

out_structure = structure;
[N, n_plus_one] = size(structure);
layers = flip(1:n_plus_one -1);

for i = layers
    indices = tree(:,2) == i;
    nodes = sortrows(tree(indices, :));
    for j = 1:size(nodes)
        node = nodes(j, :);
        value = solve_node(node, out_structure);
        out_structure(node(1), node(2)) = value;
    end
end
end

