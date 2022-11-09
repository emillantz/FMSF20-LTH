addpath('../data')

clc; clear
%% Load data
load ../data/kroppsTemp.mat
whos T

%% Histograms
figure(1)
histogram(T(:,1));
figure(2)
plot(T(:,1), '.')

figure(3)
subplot(2, 1, 1)
histogram( T(T(:,2)==1,1))
subplot(2, 1, 2)
histogram( T(T(:,2)==2,1))

figure(5)
plot(sort(T(:,1)),1:size(T,1),'.')