function [pL pT] = pressurehydro( w,tau )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
a4=w^4./tau.^(4/3) - 2*w^3./(3*tau.^2) + (1 + 2*log(2))*w^2./(18*tau.^(8/3))+(-3+2*pi^2+24*log(2)-24*log(2)^2)*w./(486*tau.^(10/3));
a4p=-(4/3)*w^4./tau.^(7/3) + 4*w^3./(3*tau.^3) -(8/3)*(1 + 2*log(2))*w^2./(18*tau.^(11/3))-(10/3)*(-3+2*pi^2+24*log(2)-24*log(2)^2)*w./(486*tau.^(13/3));
a4p=tau.*a4p;
pL=-a4-a4p;
pT=a4+0.5*a4p;