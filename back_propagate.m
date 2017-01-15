function out_structure = back_propagate(tree, structure)
out_structure = structure;
[N, n_plus_one] = size(structure);
layers = flip(1:n_plus_one -1);

for i = layers
    indices = tree(:,2) == i;
    nodes = sort(tree(indices, :));
    rowfun
end


end

