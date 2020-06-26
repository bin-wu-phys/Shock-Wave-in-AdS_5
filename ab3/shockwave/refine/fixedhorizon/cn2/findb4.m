function [b4 b4t1 b4t2] = findb4(a1, a1nm1, a1nm2, a1t1,a1t1nm1,a1t1nm2,a1t2,a1t2nm1,a1t2nm2,a4,a4nm1,a4nm2, b4nm1,b4nm2,b4t1nm1,b4t1nm2,tau,dtau, B, Bnm1,Bnm2,r)
%find b4 at tau
%   b4nm1:  b4 at tau - dtau
%   a4:     a4 at tau
%   B:      B at tau
%   r:      r
%
fb4=b4nm1+0.5*dtau*b4t1nm1;
fb4p=b4t1nm1+0.5*dtau*fb4t2(a1nm1,a1t1nm1,a1t2nm1,a4nm1,b4nm1,b4t1nm1,tau-dtau,Bnm1,r);
%
b4=(8*(630*fb4*tau^6+45*dtau*tau^5*(fb4+7*fb4p*tau+12*fb4*r*tau)+2*dtau^2*(232+3*r*tau*(-24+5*r^2*tau^2*(2+3*r*tau*(-1+r*tau*(2+3*B*r*tau))))))+dtau*tau*(45*dtau*tau^3*(35-6*r*tau)*a1^4+405*dtau*tau^4*a1^5+dtau*tau^2*a1^3*(4031-900*r*tau-1350*tau^2*(a1t1))+3*dtau*tau*a1^2*(8*(292-75*r*tau+15*r^3*tau^3)+15*tau^2*((-73+12*r*tau)*(a1t1)+7*tau*(a1t2)))+2*a1*(-5400*fb4*tau^5+dtau*(3742-360*r*tau*(3+r^2*tau^2*(-1+r*tau)))+45*dtau*tau^2*(8*tau^2*a4+(a1t1)*(-47+12*r*tau+7*tau^2*(a1t1))+7*tau*(a1t2)))+6*dtau*tau*(16*tau^2*(7-3*r*tau)*a4+5*(48*r^6*tau^4*log(tau)+(a1t1)*(-82+24*r*tau+21*tau^2*(a1t1))+14*tau*(a1t2)))))/(24*tau^4*(-32*dtau^2+15*dtau*tau+30*(7+3*dtau*r*(2+dtau*r))*tau^2+45*dtau*tau^2*a1*(-10-4*dtau*r+5*dtau*a1)));
b4t1=(8*(315*fb4p*tau^6+2*dtau*(232-72*r*tau+30*r^3*tau^3+3*(16*fb4-15*r^4)*tau^4+90*r^5*tau^5+135*r^2*(-fb4+B*r^4)*tau^6))+dtau*tau*(45*tau^3*(35-6*r*tau)*a1^4+405*tau^4*a1^5+tau^2*a1^3*(4031-900*r*tau-1350*tau^2*(a1t1))+3*tau*a1^2*(8*(292-75*r*tau+15*r^3*tau^3-225*fb4*tau^4)+15*tau^2*((-73+12*r*tau)*(a1t1)+7*tau*(a1t2)))+a1*(7484+720*r*tau*(-3+tau^2*(r^2-r^3*tau+6*fb4*tau^2))+90*tau^2*(8*tau^2*a4+(a1t1)*(-47+12*r*tau+7*tau^2*(a1t1))+7*tau*(a1t2)))+6*tau*(16*tau^2*(7-3*r*tau)*a4+5*(48*r^6*tau^4*log(tau)+(a1t1)*(-82+24*r*tau+21*tau^2*(a1t1))+14*tau*(a1t2)))))/(12*tau^4*(-32*dtau^2+15*dtau*tau+30*(7+3*dtau*r*(2+dtau*r))*tau^2+45*dtau*tau^2*a1*(-10-4*dtau*r+5*dtau*a1)));
b4t2 = fb4t2(a1,a1t1,a1t2,a4,b4,b4t1,tau,B,r);

function b4t2 = fb4t2(a1,a1t1,a1t2,a4,b4,b4t1,tau,B,r)
b4t2=(1/(1260*tau^6))*(3712-1152*r*tau+480*r^3*tau^3-720*r^4*tau^4+1440*r^5*tau^5+2160*B*r^6*tau^6+7484*tau*a1-2160*r*tau^2*a1+720*r^3*tau^4*a1-720*r^4*tau^5*a1+7008*tau^2*a1^2-1800*r*tau^3*a1^2+360*r^3*tau^5*a1^2+4031*tau^3*a1^3-900*r*tau^4*a1^3+1575*tau^4*a1^4-270*r*tau^5*a1^4+405*tau^5*a1^5+672*tau^4*a4-288*r*tau^5*a4+720*tau^5*a1*a4+768*tau^4*b4-2160*r^2*tau^6*b4+4320*r*tau^6*a1*b4-5400*tau^6*a1^2*b4+1440*r^6*tau^6*log(tau)-2460*tau^2*(a1t1)+720*r*tau^3*(a1t1)-4230*tau^3*a1*(a1t1)+1080*r*tau^4*a1*(a1t1)-3285*tau^4*a1^2*(a1t1)+540*r*tau^5*a1^2*(a1t1)-1350*tau^5*a1^3*(a1t1)+630*tau^4*(a1t1)^2+630*tau^5*a1*(a1t1)^2-180*tau^5*(b4t1)-2160*r*tau^6*(b4t1)+5400*tau^6*a1*(b4t1)+420*tau^3*(a1t2)+630*tau^4*a1*(a1t2)+315*tau^5*a1^2*(a1t2));

