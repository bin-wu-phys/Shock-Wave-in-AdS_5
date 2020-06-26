function [B S] = initializemetric(tau,r,dr,mu,cbar)
%
%Initialize Metric
%
%Sigma = (-(-15*r.^6 - mu^2*(36 + r*tau.*(54 + 25*r*tau))).^(2/3).*((1 + r*tau).*(-105*r.^6.*(1 + r*tau) + 2*mu^2*(180 + 7*r*tau.*(72 + r*tau.*(69 + 25*r*tau))))).^(1/3)).^(1/2)./(7^(1/6)*sqrt(15)*r.^(7/3));
  
N = length(r)-1;
L = r(1);


S = r.^3.*tau + r.^2 +(72 + 14*r*tau.*(9 + 5*r*tau))*mu^2./(105*( r.^4 + cbar*mu^(4/3))); % S = Sigma^3
%
Sigma = S.^(1/3);
cb = -2*log( tau+1./r )/3 + (612 + 7*r*tau.*(234 + r*tau.*(217 + 75*r*tau)))*mu^2./(315*r.^6.*(1 + r*tau));
%
np=1;
drSigma=np*Sigma./r+r.^np.*(dr*(Sigma./r.^np));
drB = ( -2*(dr*drSigma)./Sigma).^(0.5)+((2*(-105*r.^6.*(1+r*tau)+mu^2*(1836+7*r*tau.*(891+r*tau.*(1136+5*r*tau.*(131+30*r*tau))))))./(315*r.^7.*(1+r*tau).^2));
B = [0; dr(2:N+1,2:N+1)\drB(2:N+1)] + cb;
%(log(7*r.^2.*(-15*r.^6 - mu^2*(36 + r*tau.*(54 + 25*r*tau)))) - log((1 + r*tau).*(-105*r.^6.*(1 + r*tau) + 2*mu^2*(180 + 7*r*tau.*(72 + r*tau.*(69 + 25*r*tau))))))/3;
%
