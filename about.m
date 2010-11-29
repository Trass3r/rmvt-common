function about(var)
    w = whos('var');

    ss = sprintf('%d', w.size(1));
    for i=2:length(w.size)
        ss = strcat(ss, sprintf('x%d', w.size(i)));
    end
    fprintf('%s [%s] : %s (%d bytes)\n', ...
        inputname(1), w.class, ss, w.bytes);
