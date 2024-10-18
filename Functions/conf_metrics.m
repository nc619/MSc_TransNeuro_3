function [outputArg1,outputArg2] = conf_metrics(my_confmat, mode)
if mode == 1
    disp("True Positives (TP) = "+my_confmat(1,1))
    disp("True Negatives (TN) = "+my_confmat(2,2))
    disp("False Positives (FP) = "+my_confmat(1,2))
    disp("False Negatives (FN) = "+my_confmat(2,1))
elseif mode == 2
    tp = my_confmat(1,1);
    tn = my_confmat(2,2);
    fp = my_confmat(1,2);
    fn = my_confmat(2,1);
    disp("Recall = "+(tp/(tp+fn)))
    disp("Precision = "+(tp/(tp+fp)))
    disp("Specificity = "+(tn/(tn+fp)))
end

