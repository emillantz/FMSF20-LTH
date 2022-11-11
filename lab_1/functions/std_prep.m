function [mu, sigma] = std_prep(vec)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    mu = mean(vec(:,1));
    sigma = std(vec(:,1));
end

