n = 7;
p = 0.75;
U = rand(1, n);
U <= p;
X = sum(U <= p);

figure(1)
stem(U)
refline(0, p)

X = binornd(n, p)

%simulate binomial distribution with n = 100 and p = 0.75 and plot a histogram and a bar chart
N = 100;
X = binornd(n, p, N, 1);
seeds = hist(X, 0:n);
seeds(4)
sum(X==3)
figure(2)
bar(0:n, seeds)
xlabel('number of seeds that germinated')
ylabel('number of trials')

%central limit theorem - binomial distribution where n = 7 and p = 0.75
n = 7;
p = 0.75;
N = 10000;
X = binornd(n, p, N, 1);
figure(3)
hist(X, 0:n)
xlabel('number of seeds that germinated')
ylabel('number of trials')
