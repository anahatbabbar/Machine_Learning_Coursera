function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

a1 = [ones(m,1) X];

z2 = Theta1 * a1';

negZ2 = -1 .* z2;
expNegZ2 = e .^ negZ2;
onePlusExpNegZ2 = 1 .+ expNegZ2;

gZ2 = 1 ./ onePlusExpNegZ2;
gZ2 = gZ2';
size(gZ2,1)
a2 = [ones(m,1) gZ2];

z3 = Theta2 * a2';

negZ3 = -1 .* z3;
expNegZ3 = e .^ negZ3;
onePlusExpNegZ3 = 1 .+ expNegZ3;

gz3 = 1 ./ onePlusExpNegZ3;

a3 = gz3;

[i, ix] = max(a3);

p = ix';



% =========================================================================


end
