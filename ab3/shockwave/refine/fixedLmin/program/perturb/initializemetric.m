function [A B S theta phi] = initializemetric(tau,r,mu)
%
%Initialize Metric
%
S = r.^3.*tau + r.^2 + ( 72 + 14*r*tau.*( 9 + 5*r*tau ))*mu^2./(105*r.^4);%r.^3.*tau + r.^2; % S = Sigma^3
A = r.^2 -4*mu^2*tau^2./(3*r.^2) - 4*tau*mu^2./(3*r.^3) - 6*mu^2./(5*r.^4); 
B = - 2*log(tau + 1./r)/3 + ( 612 + 7*r*tau.*( 234 + tau*r.*( 217 +75*tau*r )) )*mu^2./(315*r.^6.*(1+tau*r));
%
theta = (1575*r.^12.*(4 + 3*r*tau) + 4*mu^4*(9 + 10*r*tau.*(1 + r*tau)).*(144 + 7*r*tau.*(27 + 10*r*tau)) - 180*mu^2*r.^6.*(24 + 7*r*tau.*(9 + 5*r*tau.*(2 + r*tau))))./(18900*r.^9);
phi = -S.^(1/2).*(-1575*r.^12.*(1 + r*tau) - 15*mu^2*r.^6.*(936 + 7*r*tau.*(9 + 5*r*tau).*(55 + 3*r*tau.*(17 + 10*r*tau))) + 2*mu^4*(9 + 10*r*tau.*(1 + r*tau)).*(1836 + 7*r*tau.*(891 + r*tau.*(1136 + 5*r*tau.*(131 + 30*r*tau)))))./(4725*r.^11.*(1 + r*tau).^2);

