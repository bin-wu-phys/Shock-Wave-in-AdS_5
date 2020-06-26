function [b4 b4t1 b4t2] = findb4(b4nm1,b4nm2,a4,tau,dtau, B,r)
%find b4 at tau
%   b4nm1:  b4 at tau - dtau
%   a4:     a4 at tau
%   B:      B at tau
%   r:      r

Bs0 = -2./(9*r.^3*tau^3) + 1./(3*r.^2*tau^2) - 2./(3*r*tau) - 2*log(tau)/3 + 2*(4 + tau^4*a4)./(15*r.^5*tau^5) + ( -928-168*tau^4*a4 )./(540*r.^6*tau^6);
Fb4d0 = -b4nm1./(dtau*r.^5) + ( -(dtau + 14*tau)*b4nm1 + 7*tau*b4nm2 )./(12*dtau^2*tau*r.^6);
cb4 = 1./r.^4 + 1./(dtau*r.^5) + ( -64*dtau^2 + 15*tau*dtau + 105*tau^2 )./( 180*tau^2*dtau^2*r.^6);
%
b4 = sum(B - Bs0 - Fb4d0)/sum(cb4);
b4t1 = (b4 - b4nm1)/dtau;b4t2 = ( b4 - 2*b4nm1 + b4nm2 )/dtau^2;
%
end

