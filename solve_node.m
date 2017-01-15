function value = solve_node(node, structure)
% Solves the value for a given node in a structure. It proceeds by looking
% at its children and the second parent.

row = node(1);
col = node(2);

% Value alredy exists
if(~isnan(structure(row, col)))
    value = structure(row,col);
    return;
end

subbranches = get_subbranches(node);
child_top = subbranches(1, :);
child_bot = subbranches(2, :);

is_top = child_top(1) == row;

if(is_top)
    parent_top = node;
    parent_bot = [child_bot(1), child_bot(2) - 1];
else 
    parent_top = [child_top(1), child_top(2) - 1];
    parent_bot = node;
end

%case 1
if(is_top)
    y = structure(child_top(1), child_top(2));
    if(isnan(y))
        value = NaN;
        return;
    end
    
    z_child = structure(child_bot(1), child_bot(2));
    if(~isnan(z_child))
        value = mod(y + z_child, 2);
        return;
    end
    
    z_parent = structure(parent_bot(1), parent_bot(2));
    if(~isnan(z_parent))
        value = mod(y + z_parent, 2);
        return;
    end
    
    value = NaN;
    return;
end

%case 2
if(~is_top)
    z = structure(child_bot(1), child_bot(2));
    if(~isnan(z))
        value = z;
        return;
    end
    
    y = structure(child_top(1), child_top(2));
    if(isnan(y))
        value = NaN;
        return;
    end
    
    u = structure(parent_top(1), parent_top(2));
    if(isnan(u))
        value = NaN;
        return;
    end
    
    value = mod(y + u, 2);
    return;
end





