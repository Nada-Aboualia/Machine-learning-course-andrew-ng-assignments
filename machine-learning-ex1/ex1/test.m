X = [ones(m, 1), data(:,1)]; y = data(:, 2);
theta = zeros(2, 1); % initialize fitting parameters

% Some gradient descent settings
iterations = 1500;
alpha = 0.01;
gradientDescent(X, y, theta, alpha, iterations)