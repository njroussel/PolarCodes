function erasures = compute_p_erasures(n, p_erasure)
%

    function y = f_minus(x)
        y = 1 - ((1 - x).^2);
    end

    function y = f_plus(x)
        y = x.^2;
    end 

    function out = split(e)
        l_e = f_minus(e);
        r_e = f_plus(e);
        out = [l_e r_e];
    end

erasures = p_erasure;
for i = 1:n
    erasures = cell2mat(arrayfun(@(x) split(x), erasures, 'un', 0));
end
end