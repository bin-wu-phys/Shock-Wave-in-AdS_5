function a4np1 = finda4( a4,b4,tau, dtau )
%find a4 at tau + dtau
%   a4:  a4 at tau
%   b4:     b4 at tau

%da4/dtau at tau
a4t1 = 4/(9*tau^5) - 4*a4/(3*tau) - 8*b4/(3*tau);
a4np1 = a4 + dtau*a4t1;%a4 at tau + dtau;

