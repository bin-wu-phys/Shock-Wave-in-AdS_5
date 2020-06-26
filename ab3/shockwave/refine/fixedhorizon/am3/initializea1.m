function [a1 a1nm1 a1nm2 a1t1 a1t2] = initializea1( tau, dtau,mu,cbar )
% Find a1 at initial time
% (tau, dtau, mu, cbar)
a1 = fzero(@(x)thetah(x,tau,mu,cbar),0);
a1nm1 = fzero(@(x)thetah(x,tau-dtau,mu,cbar),0);
a1nm2 = fzero(@(x)thetah(x,tau-2*dtau,mu,cbar),0);
a1t1 = (a1 - a1nm1)/dtau;
a1t2 = (a1 - 2*a1nm1 + a1nm2)/dtau^2;


function thetah = thetah(a1,tau,mu,a)
% theta at r = 1 at tau
% a = cbar
thetah=1/(6720*a^(3/4))*(-32*sqrt(2)*mu*pi*(36+35*sqrt(a)*mu^(2/3)*tau^2)+35*a^(3/4)*(8*(2+a1)^3+3*(2+a1)^4*tau-64*mu^2*tau^3)+16*mu*(-2*(36*sqrt(2)+7*a^(1/4)*mu^(1/3)*tau*(18+5*sqrt(2)*a^(1/4)*mu^(1/3)*tau))*atan(1-(2+a1)/(sqrt(2)*a^(1/4)*mu^(1/3)))+(72*sqrt(2)+14*a^(1/4)*mu^(1/3)*tau*(-18+5*sqrt(2)*a^(1/4)*mu^(1/3)*tau))*atan(1+(2+a1)/(sqrt(2)*a^(1/4)*mu^(1/3)))+sqrt(2)*(-36+35*sqrt(a)*mu^(2/3)*tau^2)*(log(sqrt(a)*mu^(2/3)-(a^(1/4)*mu^(1/3)*(2+a1))/sqrt(2)+1/4*(2+a1)^2)-log(sqrt(a)*mu^(2/3)+(a^(1/4)*mu^(1/3)*(2+a1))/sqrt(2)+1/4*(2+a1)^2))));