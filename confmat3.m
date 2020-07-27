function [conmat] = confmat3 (ann,pred)

total_pred = length(pred);

for i = 1:length(pred)
    [val,temp]=min(abs(ann-pred(i)));
    if (val<36)
        b(i) = temp;
    else
        b(i) = 0;
    end
end

TPval = unique(b,'first');
TP = length(TPval);
FP = total_pred - TP;

for j = 1 : length(ann)
    [val,temp]=min(abs(ann(j)-pred));
    if (val<36)
        c(j) = temp;
    else
        c(j) = 0;
    end
end

FN = length(c) - length(find(c));

conmat = [TP ; FP; FN ];
end