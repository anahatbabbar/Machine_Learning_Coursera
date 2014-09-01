function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

hminusres = X*theta - y;
squarehminusres = hminusres .^ 2;

sum = 0;
for i = 1:length(squarehminusres)
	sum = sum + squarehminusres (i,1);
end

J = sum / (2*length(X));
fprintf('J is : ');
fprintf('%f \n',J); 


% =========================================================================

end
