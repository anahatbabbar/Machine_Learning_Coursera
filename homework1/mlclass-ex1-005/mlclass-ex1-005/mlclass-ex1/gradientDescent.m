function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %


n = length(theta);
deltaVector = zeros(n,1); % initialize delta vector

for j = 1:n
	%deltaCalculateX = X(j,:);
	%xi = X(:,j);
	%deltaVector(j,1) = 	xi * (theta' * deltaCalculateX - y);

	deltaVector(j,1) = X(:,j)' * ((theta' * X')' - y) ;
end

theta = theta - alpha *(1/m) * deltaVector;

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
