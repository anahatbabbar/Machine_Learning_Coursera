function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%


hypotheses = X*theta;
hypoMinusY = hypotheses - y;
hypoMinusYsq = hypoMinusY .^ 2;

sqErrorSum = sum(hypoMinusYsq);

UnRegularizedCost = (1/(2*m))* sqErrorSum;

thetaMinusZero = theta(2:size(theta,1),:);
thetaMinusZeroSq = thetaMinusZero .^ 2;
sumThetaMinusZeroSq = sum(thetaMinusZeroSq);

regularizedCost = UnRegularizedCost + (lambda/(2*m))*sumThetaMinusZeroSq;

J = regularizedCost;

gradTheta = theta;
gradTheta(1,1) = (1/m)* sum(hypoMinusY .* X(size(X,1),1));

for j = 2 : size(theta,1)
	interimSum = 0;
	for i = 1 : m
		interimSum = interimSum + hypoMinusY(i,1) * X(i,j);
	end
	interimSum = (1/m) * interimSum;
	gradTheta(j,1) = interimSum + (lambda/m)* theta(j,1);
end

grad = gradTheta;

% =========================================================================

grad = grad(:);

end
