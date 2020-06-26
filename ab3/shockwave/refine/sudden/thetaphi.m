function [theta phi] = thetaphi(dr, B, S, tau, a4, b4, b4t1, b4t2, L, N)

cs = 0.25*tau*L^4 + L^3/3 + 0.25*tau*a4 + ( -6*b4 + 1/tau^4)/(15*L) - ( 28+3*tau^4*( 2*a4 + 4*b4 + 15*tau*b4t1 ) )/(270*tau^5*L^2) + ( 2668 + 3*tau^4*( 152*a4 + 304*b4 - 15*tau*( 11*b4t1 + 21*tau*b4t2 ) ) )/(17010*tau^6*L^3);
theta = [0; dr(2:N+1,2:N+1)\S(2:N+1)] + cs;  


cb = L^(1.5)/(3*tau^0.5) - L^(0.5)/(6*tau^(1.5)) + 1/(8*tau^(2.5)*L^0.5) + (-7 + 32*tau^4*b4 )/(16*tau^(3.5)*L^(1.5)) + (355+192*tau^4*( 2*b4 + 3*tau*b4t1 ))/(384*L^2.5*tau^4.5) + ( -7067 + 64*tau^4*( -4*a4 - 27*b4 + 15*tau*( 4*b4t1 + 3*tau*b4t2 ) ) )/( 3840*L^3.5*tau^5.5 );
drphi = 3*(dr*B).*(S.^(-0.5)).*theta;
phi = [0; dr(2:N+1,2:N+1)\drphi(2:N+1)] +cb;