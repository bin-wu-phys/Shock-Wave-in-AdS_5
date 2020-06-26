function a4np1 = finda4(a1,a1nm1,a1nm2, a4,a4nm1,a4nm2,b4,b4nm1,b4nm2,tau,dtau )
%find a4 at tau + dtau
% a4:  a4 at tau
% ( a1,a4,b4,tau, dtau )

a4np1 = a4 + dtau*(23*fa4t1(a1,a4,b4,tau)-16*fa4t1(a1nm1,a4nm1,b4nm1,tau-dtau)+5*fa4t1(a1nm2,a4nm2,b4nm2,tau-2*dtau))/12;%a4 at tau + dtau;

function a4t1=fa4t1(a1,a4,b4,tau)
a4t1 = -2*(-2 - 4*tau*a1 - 3*tau^2*a1^2 - tau^3*a1^3 + 6*tau^4*a4 + 12*tau^4*b4)/(9*tau^5);
