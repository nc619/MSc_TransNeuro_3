function [ldaModel, predicted_labels, X_train, y_train, X_test, y_test] = lda_fit(X,y)

X_std = (X - mean(X)) ./ std(X);

random_indices = randperm(length(y));
train_len = round(2*length(y)/3);
X_train = X_std(random_indices(1:train_len),:);
X_test = X_std(random_indices(train_len+1:end),:);
y_train = y(random_indices(1:train_len));
y_test = y(random_indices(train_len+1:end));

% Train the LDA model
ldaModel = fitcdiscr(X_train, y_train);

% Predict labels using the trained model
predicted_labels = predict(ldaModel, X_test);
end