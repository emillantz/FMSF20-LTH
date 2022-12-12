addpath('../data/')
%% 2
x = [1:8]';
y = [1.5 2.3 1.7 2.0 2.5 1.9 2.2 2.4]';
X = [ones(size(x)) x];

[b, bint] = regress(y, X);

mu = X * b;
figure(1)
plot(x,y,'*',x, mu, '-');
refline(b(2), b(1));

reggui(x,y)

%% 3    
co2 = load('../data/co2.dat');
figure(4)
plot(co2)

z = reshape(co2, 12, []);
y = mean(z)';
x = (1:length(y))';
plot(x, y, 'o')
reggui(x, y)

%% 4.1
load ('../data/cement.dat')

corrcoef(cement)
x = cement(:,1:4);
Y = cement(:,5);
plotmatrix(cement)

%% 4.2
X = [ones(size(Y)) x];
beta = X\Y;
res = Y-X*beta;
[n, c] = size(X);
f = n-c;
s2 = sum(res.^2)/f;
Vbeta = s2*inv(X'*X)
plot(res,'o')
kvantil = tinv(1-0.05/2, f)
IbetaL = beta - kvantil*sqrt(diag(Vbeta))
IbetaH = beta + kvantil*sqrt(diag(Vbeta))

[beta,Ibeta,res,resint,stats] = regress(Y, X, 0.05);
stepwise(x,Y)
[betaN, IbetaN] = regress(Y, X(:,[1,4]), 0.05)


%% 5
load ('../data/flow.mat')
reggui(fx1,fy1)
reggui(fx2,fy2)

n = length(fx2)
Sxx = sum((fx2-mean(fx2)).^2)
Syy = sum((fy2-mean(fy2)).^2)
Sxy = sum((fx2-mean(fx2)).*(fy2-mean(fy2)))