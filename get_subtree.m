function subtree = get_subtree(index, n)
% For a given index (node) in the graphical model, it returns all its child
% indicies (subtree) up to a depth of n.

if(index(2) == n -1)
   subtree = cat(1, index, get_subbranches(index));
else
    subbranches = get_subbranches(index);
    subtree_1 = get_subtree([subbranches(1), index(2) + 1], n);
    subtree_2 = get_subtree([subbranches(2), index(2) + 1], n);
    subtree = cat(1, index, subtree_1, subtree_2);
end

end
