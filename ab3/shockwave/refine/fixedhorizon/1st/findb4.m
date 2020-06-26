function b4 = findb4(a1, a1nm1, a1nm2, b4nm1,b4nm2,a4,tau,dtau, S,B,r)
%find b4 at tau
%   b4nm1:  b4 at tau - dtau
%   a4:     a4 at tau
%   B:      B at tau
%   r:      r

a1t1=(a1-a1nm1)/dtau;
a1t2=(a1-2*a1nm1+a1nm2)/dtau^2;
Bs0=-(2./(3*r*tau))+(1+tau*a1)./(3*r.^2*tau^2)-(4+3*tau*a1*(2+tau*a1))./(18*r.^3*tau^3)-(2*log(tau))/3+(64+tau*(50*tau^2*a1^3+15*tau^3*a1^4+8*(2*tau^3*a4-5*tau*(a1t1))+10*tau*a1^2*(10-3*tau^2*(a1t1))-60*a1*(-2+tau^2*(a1t1))))./(120*r.^5*tau^5)+1./(2160*r.^6*tau^6)*(-3712+tau*(-1575*tau^3*a1^4-405*tau^4*a1^5+tau^2*a1^3*(-4031+1350*tau^2*(a1t1))+6*tau*(410*(a1t1)+tau*(tau*(-112*a4-105*(a1t1)^2)-70*(a1t2)))+a1^2*(-7008*tau+45*tau^3*(73*(a1t1)-7*tau*(a1t2)))-2*a1*(3742+45*tau^2*(-47*(a1t1)+tau*(tau*(8*a4+7*(a1t1)^2)+7*(a1t2))))));
Fb4d0=-(b4nm1./(dtau*r.^5))+((-dtau-14*tau+30*dtau*tau*a1)*b4nm1+7*tau*b4nm2)./(12*dtau^2*tau*r.^6);
cb4=(1./r)^4+(1/dtau-2*a1)./r.^5+(-64*dtau^2+15*dtau*tau+105*tau^2+450*dtau*tau^2*a1*(-1+dtau*a1))./(180*dtau^2*tau^2*r.^6);
%
%Ss0=(1./(22680*r.^4*tau^6)).*(8*(-1334+21*r*tau.*(28+9*r*tau.*(-1+15*r.^4*tau^4.*(1+r*tau))))+tau*(126*tau^3*(-19+6*r*tau)*a1^4-567*tau^4*a1^5+7*tau^2*a1^3*(-1049+3*r*tau.*(130-36*r*tau+135*r.^3*tau^3)+405*tau^2*(a1t1))+6*tau*(1150*(a1t1)+tau*(8*tau*(-38+21*r*tau)*a4+15*(-28*r*(a1t1)-21*tau*(a1t1)^2-14*(a1t2))))+3*tau*a1^2*(-5078+42*r*tau.*(50+9*r*tau.*(-2+5*r.^2*tau^2.*(1+3*r*tau)))+3*tau^2*(785*(a1t1)-105*tau*(2*r*(a1t1)+(a1t2))))+2*a1*(2*(-4745+21*r*tau.*(100+9*r*tau*(-4+15*r.^3*tau^3.*(2+3*r*tau))))-9*tau^2*(-575*(a1t1)+21*tau*(4*tau*a4+5*(2*r*(a1t1)+tau*(a1t1)^2+(a1t2)))))));
%Fs4d0=-(b4nm1./(3*dtau*r.^3))-(11*b4nm1)./(126*dtau*r.^4*tau)+(a1*b4nm1)./(2*dtau*r.^4)+(-2*b4nm1+b4nm2)./(6*dtau^2*r.^4);
%cs4=(-304*dtau^2+3*dtau*(55+56*dtau*r)*tau+63*(5+2*dtau*r.*(5+6*dtau*r))*tau^2+63*dtau*tau*a1*(-4*dtau-3*(5+4*dtau*r)*tau+9*dtau*tau*a1))./(1890*dtau^2*r.^4*tau^2);
b4 = sum(B - Bs0 - Fb4d0)/sum(cb4);
end

