function A = getA( dr,dri,B, S, theta, phi, tau, a1, a1t1, a1t2, a4,b4,b4t1,b4t2, r )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
N = length(r);
cdrdrA=2+(6*a4)./r.^4+(4*(2+3*tau^2*a1^2+tau^3*a1^3+tau*a1*(4-9*tau^4*a4)-6*tau^4*(a4+2*b4)))./(3*tau^5*r.^5)+(-32+tau*(-37*tau^2*a1^3-10*tau^3*a1^4+6*a1*(-12+10*tau^4*(a4+2*b4)+3*tau^2*(a1t1))+tau*a1^2*(-70+45*tau^4*a4+9*tau^2*(a1t1))+12*tau*((a1t1)+tau^2*(2*a4+4*b4-3*tau*(b4t1)))))./(3*tau^6*r.^6)+1./(81*tau^7*r.^7)*(2512+tau*(1782*tau^3*a1^4+405*tau^4*a1^5+tau^2*a1^3*(4289-243*(5*tau^4*a4+3*tau^2*(a1t1)))-3*tau*a1^2*(-2162+15*tau^2*(54*tau^2*(a4+2*b4)+43*(a1t1)-3*tau*(a1t2)))+2*a1*(2950+9*tau^2*(-137*(a1t1)+3*tau*(tau*(-36*a4-72*b4+5*(a1t1)^2+54*tau*(b4t1))+5*(a1t2))))-6*tau*(226*(a1t1)+tau*(-30*(a1t2)+tau*(80*a4+160*b4-45*(a1t1)^2-138*tau*(b4t1)+90*tau^2*(b4t2))))));
drdrA = -4 + 3*S.^(-0.5).*(dr*B).*phi + 8*(dr*S).*theta.*(S.^(-2));
cdrA=2*r+a1-(2*a4)./r.^3+(-2-3*tau^2*a1^2-tau^3*a1^3+tau*a1*(-4+9*tau^4*a4)+6*tau^4*(a4+2*b4))./(3*tau^5*r.^4)+(1./(15*tau^6*r.^5))*(32-tau*(-37*tau^2*a1^3-10*tau^3*a1^4+6*a1*(-12+10*tau^4*(a4+2*b4)+3*tau^2*(a1t1))+tau*a1^2*(-70+45*tau^4*a4+9*tau^2*(a1t1))+12*tau*((a1t1)+tau^2*(2*a4+4*b4-3*tau*(b4t1)))))+1./(486*tau^7*r.^6)*(-2512+tau*(-1782*tau^3*a1^4-405*tau^4*a1^5+tau^2*a1^3*(-4289+1215*tau^4*a4+729*tau^2*(a1t1))+3*tau*a1^2*(-2162+15*tau^2*(54*tau^2*(a4+2*b4)+43*(a1t1)-3*tau*(a1t2)))-2*a1*(2950+9*tau^2*(-137*(a1t1)+3*tau*(tau*(-36*a4-72*b4+5*(a1t1)^2+54*tau*(b4t1))+5*(a1t2))))+6*tau*(226*(a1t1)+tau*(-30*(a1t2)+tau*(80*a4+160*b4-45*(a1t1)^2-138*tau*(b4t1)+90*tau^2*(b4t2))))));
drA = [0; dri*(drdrA(2:N)-cdrdrA(2:N))] + cdrA;
ca=r.^2+a1*r+1./4*(a1^2-4*(a1t1))+a4./r.^2+(2+3*tau^2*a1^2+tau^3*a1^3+tau*a1*(4-9*tau^4*a4)-6*tau^4*(a4+2*b4))./(9*tau^5*r.^3)+(1./(60*tau^6*r.^4))*(-32+tau*(-37*tau^2*a1^3-10*tau^3*a1^4+6*a1*(-12+10*tau^4*(a4+2*b4)+3*tau^2*(a1t1))+tau*a1^2*(-70+45*tau^4*a4+9*tau^2*(a1t1))+12*tau*((a1t1)+tau^2*(2*a4+4*b4-3*tau*(b4t1)))))+1./(2430*tau^7*r.^5)*(2512+tau*(1782*tau^3*a1^4+405*tau^4*a1^5+tau^2*a1^3*(4289-243*(5*tau^4*a4+3*tau^2*(a1t1)))-3*tau*a1^2*(-2162+15*tau^2*(54*tau^2*(a4+2*b4)+43*(a1t1)-3*tau*(a1t2)))+2*a1*(2950+9*tau^2*(-137*(a1t1)+3*tau*(tau*(-36*a4-72*b4+5*(a1t1)^2+54*tau*(b4t1))+5*(a1t2))))-6*tau*(226*(a1t1)+tau*(-30*(a1t2)+tau*(80*a4+160*b4-45*(a1t1)^2-138*tau*(b4t1)+90*tau^2*(b4t2))))));
A = [0; dri*(drA(2:N)-cdrA(2:N))] + ca;
