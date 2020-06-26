function [B S] = initializemetric(a1, tau,r,dr,mu,cbar)
% Initialize Metric
% (a1, tau, r, dr, mu, cbar)
  
N = length(r)-1;
L = r(1);

r = r+0.5*a1;

S = r.^3.*tau + r.^2 +(72 + 14*r*tau.*(9 + 5*r*tau))*mu^2./(105*( r.^4 + cbar*mu^(4/3))); % S = Sigma^3
%
Sigma = S.^(1/3);
L = L+0.5*a1;
cb = -2*log( tau+1/L )/3 + (612 + 7*L*tau*(234 + L*tau*(217 + 75*L*tau)))*mu^2/(315*L^6*(1 + L*tau));
%
drB = ( -2*(dr^2*Sigma)./Sigma).^(0.5);
B = [0; dr(2:N+1,2:N+1)\drB(2:N+1)] + cb;
%(log(7*r.^2.*(-15*r.^6 - mu^2*(36 + r*tau.*(54 + 25*r*tau)))) - log((1 + r*tau).*(-105*r.^6.*(1 + r*tau) + 2*mu^2*(180 + 7*r*tau.*(72 + r*tau.*(69 + 25*r*tau))))))/3;
%
