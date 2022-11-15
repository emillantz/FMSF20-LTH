n = 7;
p = 0.75;
U = rand(1, n);
U <= p;
X = sum(U <= p);

figure(1)
stem(U)
refline(0, p)

X = binornd(n, p)

%% simulate binomial distribution with n = 100 and p = 0.75 and plot a histogram and a bar chart
N = 100;
X = binornd(n, p, N, 1);
seeds = hist(X, 0:n);
seeds(4)
sum(X==3)
figure(2)
bar(0:n, seeds)
xlabel('number of seeds that germinate')
ylabel('number of seeds planted')

%% compare to theoretical binomial distribution
bar(0:n, [seeds/N; binopdf(0:n, n, p)]')
xlabel('number of seeds that germinate')
ylabel('number of seeds packets planted')
legend('simulation', 'theoretical, location', 'northwest')

%% 2.2 central limit theorem for binomial distribution
n = 7;
p = 0.75;
np = n*p;
npq = np*(1-p);
x = linspace(np-4 * sqrt(npq), np+4 * sqrt(npq));

figure(3)
plot(0:n, binopdf(0:n, n, p))
hold on
plot(x, normcdf(x, np, sqrt(npq)))
hold off

%% 2.3 Simulaton of conditional distribution
figure(4)
subplot(2, 1, 1)
bar(0:2, binopdf(0:2, 2, 0.75))
xlabel('number of seeds that germinate')
ylabel('p(x)')

%% Po(0), Po(10), Po(20)
mu = 10;
x = 0:4*mu;
figure(4)
for i = 1:3
    subplot(2, 3, 3+i)
    bar(x, poisspdf(x, (i-1)*mu))
    title('number of seeds that germinate, ' + num2str(i-1) + ' seeds planted')
    ylabel('p(y|x=' + num2str(i-1))
end

%% Poisson distribution for max(k) = 2
pY = 0;
for i = 0:2
    pY = pY + poisspdf(x, i*mu) * binopdf(i, 2, 0.75);
end

figure(5)
bar(x, pY)
xlabel('number of new seeds(?)')

%% Poisson distribution, general case
n = 7; p=0.75; mu = 10; N = 100;
y = 0:k;
pY = zeros(size(y));

for k=0:n
    pY = pY + poisspdf(y, k*mu) * binopdf(k, n, p);
end

figure(6)
bar(y, pY)
xlabel('number of new seeds(?)')

harvest(n, p, mu);


%% 3. Central limit theorem for Poisson distribution
mu = 3;
x = poissrnd(mu, 2, 1);
xmean = mean(x);

%% General case
mu = 3; n = 2; M = 1000;
x = poissrnd(mu, n, M);
xmean = mean(x);
subplot(2, 1, 1)
hist(x(1, :), 0:15)
subplot(2, 1, 2)
hist(xmean, 0:0.5:15)