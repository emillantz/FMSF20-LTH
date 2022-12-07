addpath('../data/')

radon = load('radon200.dat');

%% Mean of radon data
K = 0.094;
g3room = mean(radon)/K

%% Standard deviation of radon data
d3room = sqrt(g3room/(10*K))

%% Interval of radon data
i3room = [g3room - norminv(1-0.05/2)*d3room, g3room + norminv(1-0.05/2)*d3room]

%% approximations

skattningar(1, 3, 5, 25, 'muskatt')

skattningar(1, 3, 5, 25, 'konfint')

%% Hypothesis testing by direct method

gamma0 = 200;
mu03room = 10*K*gamma0; % Expected value when H0 is true
y03room = sum(radon); % Sums the radon values in the 3 room house
P03room = poisscdf(y03room, mu03room) % P(Y_i <= y_i)

% calculate the p-value for the test of radon data in 3 room house

%expected value of the 3 room house
muHouse = 3 * mu03room;
yHouse = sum(y03room);
PHouse = poisscdf(yHouse, muHouse)


%% Strength function

sigma = 1.7; n = 15; mu_0 = 0, alpha = 0.05, mu_true = 1.4;


%styrkefkn(1, 10, 0, 0.05, '<')
%styrkefkn(1, 10, 0, 0.05, '>')
styrkefkn(sigma, n, mu_0, alpha, '!=', mu_true)