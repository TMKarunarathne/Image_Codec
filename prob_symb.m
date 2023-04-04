function [prob,symb] = prob_symb(input)

%symbol Frequency
[g,~,symb]=grp2idx(input(:));
Frequency=accumarray(g,1);

prob=Frequency./sum(Frequency);

[prob,index]=sort(prob);
symb =symb(index);

end