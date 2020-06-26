function [a4real Ahreal da4real] = latetimefit(w, tau)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
a4real = w^4./tau.^(4/3) - 2*w^3./(3*tau.^2) + (1 + 2*log(2))*w^2./(18*tau.^(8/3))+(-3+2*pi^2+24*log(2)-24*log(2)^2)*w./(486*tau.^(10/3));
Ahreal = w^3 - 0.5*w^2*tau.^(-2/3)+w*(2 + pi + 6*log(2))*tau.^(-4/3)/24-(35*log(2)^2/126-log(2)*pi/24+5*log(2)/216-pi^2/2592-pi/144-5/216)./tau.^2;
da4real=(-((4*w^2)./(27*tau.^(11/3)))+(4*w^3)./(3*tau.^3)-(4*w^4)./(3*tau.^(7/3))-(4*w^2*log(4))./(27*tau.^(11/3)))+(-3+2*pi^2+24*log(2)-24*log(2)^2)./(486*tau.^(10/3));
