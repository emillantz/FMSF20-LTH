addpath('../data', './functions')

clc; clear
%% Load data
load ../data/kroppsTemp.mat
whos T

%% Calculations
x = 36;
temps = T(:,1);
get_ratio(x, T)

[mu, sigma] = std_prep(T);
x = linspace(35.5, 38.5, 1e2);
%% Plots
figure(1)
histogram(T(:,1));

figure(2)
plot(T(:,1), '.')

figure(3)
subplot(2, 1, 1)
histogram( T(T(:,2)==1,1))
subplot(2, 1, 2)
histogram( T(T(:,2)==2,1))

figure(4)
boxplot(T(:,1), T(:,2))

figure(5)
plot(sort(T(:,1)),1:size(T,1),'.')

figure(6)
stairs(sort(T(:,1)),(1:size(T(:,1),1))/size(T(:,1),1));
grid on

%% Distribution plots
figure(7)
histogram(T(:,1), 'Normalization', 'pdf')
hold on
plot(x, normpdf(x, mu, sigma))

figure(8)
stairs(sort(T(:,1)), (1:size(T(:,1),1))/size(T(:,1),1), '-')
grid on
hold on
plot(x, normcdf(x, mu, sigma))

%% Random variables
data = normrnd(mu, sigma, 1, 2000);
figure(9)
histogram(data, 'Normalization', 'pdf')
hold on
plot(x, normpdf(x, mu, sigma))

figure(10)
stairs(sort(data), (1:length(data))/length(data), '.-')
hold on
plot(x, normcdf(x, mu, sigma))
grid on

normspec([-Inf 36], mu, sigma);
norminv(0.97, mu, sigma)
%% Other distribution functions
close all
x = linspace(0,10,1000);

figure(11)
plot(x,normpdf(x,2,0.5)) 
hold on
plot(x,normpdf(x,7,0.5))
plot(x,normpdf(x,5,2))
plot(x,normpdf(x,5,0.2))
xlabel('x')
title('Täthetsfunktioner, f(x)')
legend('N(2,0.5)','N(7,0.5)','N(5,2)','N(5,0.2)')

figure(12)
plot(x,normcdf(x,2,0.5))
hold on
plot(x,normcdf(x,7,0.5))
plot(x,normcdf(x,5,2))
plot(x,normcdf(x,5,0.2))
xlabel('x')
title('Fördelningsfunktioner, F(x)F')

%% Inverse Method
x = rand(1,1000);
figure(13)
histogram(x, 'Normalization', 'pdf')


x = rand(1,1000);
y = -log(1-x)/3;
figure(14)
histogram(y, 'Normalization', 'pdf')
figure(15)
%plot an empirical cdf of the data in x
stairs(sort(y),(1:length(y))/length(y))
