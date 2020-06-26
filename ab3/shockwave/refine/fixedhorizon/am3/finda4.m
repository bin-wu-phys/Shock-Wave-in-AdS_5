function a4np1 = finda4( a1,a4,b4,tau, dtau )
%find a4 at tau + dtau
% a4:  a4 at tau
% ( a1,a4,b4,tau, dtau )

a4t1 = -2*(-2 - 4*tau*a1 - 3*tau^2*a1^2 - tau^3*a1^3 + 6*tau^4*a4 + 12*tau^4*b4)/(9*tau^5);
a4np1 = a4 + dtau*a4t1;%a4 at tau + dtau;

