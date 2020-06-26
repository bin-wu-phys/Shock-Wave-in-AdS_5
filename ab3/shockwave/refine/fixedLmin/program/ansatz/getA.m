function A = getA( dr,dri,B, S, theta, phi, tau, a4,b4,b4t1,b4t2, r )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
N = length(r);
drdrA = -4 + 3*S.^(-0.5).*(dr*B).*phi + 8*drS(dr,r,S).*theta.*(S.^(-2));
cdrdrA=2+(6*a4)./r.^4-(8*(-1+3*tau^4*(a4+2*b4)))./(3*tau^5*r.^5)+(4*(-8+3*tau^4*(2*a4+4*b4-3*tau*(b4t1))))./(3*tau^6*r.^6)+(2512-12*tau^4*(40*a4+80*b4-69*tau*(b4t1)+45*tau^2*(b4t2)))./(81*tau^7*r.^7);
cdrA=2*r - 2*a4./r.^3 + ( -2 + 6*tau^4*( a4 +2*b4) )./(3*tau^5*r.^4) + 4*( 8 + 3*tau^4*( -2*a4 - 4*b4 + 3*tau*b4t1 ) )./(15*tau^6*r.^5) + ( -1256 + 6*tau^4*( 40*a4 + 80*b4 - 69*tau*b4t1 + 45*tau^2*b4t2 ))./(243*tau^7*r.^6);
drA = [0; dri*(drdrA(2:N)-cdrdrA(2:N))] + cdrA;
ca = r.^2+a4./r.^2 + ( 2 - 6*tau^4*(a4 + 2*b4))./(9*r.^3*tau^5) + ( -8 + 3*tau^4*( 2*a4 + 4*b4 - 3*tau*b4t1 ) )./(15*tau^6*r.^4) + ( 1256 - 6*tau^4*( 40*a4 + 80*b4 - 69*tau*b4t1 + 45*tau^2*b4t2 ) )./(1215*tau^7*r.^5);
A = [0; dri*(drA(2:N)-cdrA(2:N))] + ca;


