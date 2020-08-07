function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
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
C_trial = [0.01 0.03 0.1 0.3 1 3 10 30];
sigma_trial = [0.01 0.03 0.1 0.3 1 3 10 30];

% Number of trials for C and sigma
m = length(C_trial);

% Average number of wrong predictions, initialised to 1
current_error = 1;

for(i=1:m) 
    for(j=1:m) 
        % Get model from different C and sigma trial values
        model = svmTrain(X, y, C_trial(i), @(x1, x2) gaussianKernel(x1, x2, sigma_trial(j)));
        
        % Get prediction based on model obtained in last step and cross validation set
        pred = svmPredict(model, Xval);
        
        % If error rate of prediction is smaller than previous one, then set current_error to the new value,
        % and set the corresponding C and sigma to desired variables
        if (current_error > mean(double(pred ~= yval))) 
            current_error = mean(double(pred ~= yval));
            C_desired = C_trial(i);
            sigma_desired = sigma_trial(j);
        end    
    end    
end

% Set the best C and sigma value to C and sigma
C = C_desired;
sigma = sigma_desired;



% =========================================================================

end
