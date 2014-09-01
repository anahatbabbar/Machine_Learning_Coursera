function g = sigmoid(z)
%SIGMOID Compute sigmoid functoon
%   J = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).

numRows = size(z)(1,1);
numCols = size(z)(1,2);

for i = 1 : numRows
	for j = 1 : numCols
		g(i,j) = 1/(1+exp(-z(i,j)));
	end
end

%fprintf('[%0.0f %0.0f]',g);		



% =============================================================

end
