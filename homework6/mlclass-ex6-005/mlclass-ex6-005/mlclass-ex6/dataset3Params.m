function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
error = 1000;
Ccopy = 0.01;

while Ccopy < 31
	sigmaCopy = 0.01;
	while sigmaCopy < 31
		[model] = svmTrain(X, y, Ccopy, @(x1, x2) gaussianKernel(x1, x2, sigmaCopy));
		predictions = svmPredict(model, Xval);
		calculatedError = mean(double(predictions ~= yval));
		if calculatedError < error
			error = calculatedError;
			C = Ccopy;
			sigma = sigmaCopy;
		end
		sigmaCopy = sigmaCopy * 3;
	end
	Ccopy = Ccopy * 3;
end



% =========================================================================

end
