function [a4real Ahreal2nd da4real] = latetimefit(w, tau)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
a4real = w^4./tau.^(4/3) - 2*w^3./(3*tau.^2) + (1 + 2*log(2))*w^2./(18*tau.^(8/3));
lambda = (log(2)-1)/(6*w^2);Ahreal2nd = w^3 - 0.5*w^2*tau.^(-2/3)+w*(4 + pi + 12*w^2*lambda + 4*log(2))*tau.^(-4/3)/24;
da4real=(-((4*w^2)./(27*tau.^(11/3)))+(4*w^3)./(3*tau.^3)-(4*w^4)./(3*tau.^(7/3))-(4*w^2*log(4))./(27*tau.^(11/3)));
