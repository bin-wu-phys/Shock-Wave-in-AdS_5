function [a1 a1t1 a1t2] = finda1( a1nm1, a1nm2, a1t1nm1,a1t1nm2,a1t2nm1,a1t2nm2,a4,a4nm1,a4nm2, b4nm1,b4nm2,b4t1nm1,b4t1nm2,tau,dtau, B, Bnm1,Bnm2,L,dri,S,N)
%find a1 at tau + dtau
%   b4tnm2
a1 = fzero(@(x)getthetah(x, a1nm1, a1nm2, a1t1nm1,a1t1nm2,a1t2nm1,a1t2nm2,a4,a4nm1,a4nm2, b4nm1,b4nm2,b4t1nm1,b4t1nm2,tau,dtau, B, Bnm1,Bnm2,L,dri,S,N),a1nm1);
a1t1=(a1-a1nm1)/dtau;
a1t2=(a1t1-a1t1nm1)/dtau;


function thetah = getthetah(a1, a1nm1, a1nm2, a1t1nm1,a1t1nm2,a1t2nm1,a1t2nm2,a4,a4nm1,a4nm2, b4nm1,b4nm2,b4t1nm1,b4t1nm2,tau,dtau, B, Bnm1,Bnm2,L,dri,S,N)
% Get theta at r = 1
a1t1=(a1-a1nm1)/dtau;
a1t2=(a1t1-a1t1nm1)/dtau;
[b4 b4t1 b4t2] = findb4(a1, a1nm1, a1nm2, a1t1,a1t1nm1,a1t1nm2,a1t2,a1t2nm1,a1t2nm2,a4,a4nm1,a4nm2, b4nm1,b4nm2,b4t1nm1,b4t1nm2,tau,dtau, B, Bnm1,Bnm2,L);
cs=(tau*L^4)/4+1/6*(2+3*tau*a1)*L^3+1/8*a1*(4+3*tau*a1)*L^2+1/8*a1^2*(2+tau*a1)*L+(1/192*a1^3*(8+3*tau*a1)+1/4*tau*a4)+(2+tau*a1*(4+tau*a1*(3+tau*a1))-12*tau^4*b4)/(30*tau^4*L)+(1/(1080*tau^5*L^2))*(-65*tau^3*a1^3-18*tau^4*a1^4+15*tau^2*a1^2*(-10+3*tau^2*(a1t1))+a1*(-200*tau+216*tau^5*b4+90*tau^3*(a1t1))-4*(28+3*tau^2*(-5*(a1t1)+tau^2*(2*a4+4*b4+15*tau*(b4t1)))))+1/(68040*tau^6*L^3)*(10672+tau*(2394*tau^3*a1^4+567*tau^4*a1^5+7*tau^2*a1^3*(1049-405*tau^2*(a1t1))+3*tau*a1^2*(5078-3*tau^2*(785*(a1t1)+21*tau*(36*tau*b4-5*(a1t2))))+2*a1*(9490+9*tau^2*(-575*(a1t1)+21*tau*(tau*(4*a4+8*b4+5*(a1t1)^2+30*tau*(b4t1))+5*(a1t2))))-6*tau*(1150*(a1t1)+tau*(-210*(a1t2)+tau*(-304*a4-608*b4-315*(a1t1)^2+330*tau*(b4t1)+630*tau^2*(b4t2))))));
thetah = dri(end,:)*S(2:N+1) + cs;  
