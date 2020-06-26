function [b4 b4t1 b4t2 b4nm1 b4nm2] = initializeb4(a1,a1nm1,a1nm2,tau,dtau,mu)
% Initilize a4
% (a1,a1nm1,a1nm2,tau,dtau,mu)
%
b4 = (2+20*mu^2*tau^6+tau*a1*(4+tau*a1*(3+tau*a1)))/(12*tau^4);
a1 = a1nm1;tau = tau - dtau;
b4nm1 = (2+20*mu^2*tau^6+tau*a1*(4+tau*a1*(3+tau*a1)))/(12*tau^4);
a1 = a1nm2;tau = tau - dtau;
b4nm2 = (2+20*mu^2*tau^6+tau*a1*(4+tau*a1*(3+tau*a1)))/(12*tau^4);
b4t1 = (b4 - b4nm1)/dtau;
b4t2 = (b4 - 2*b4nm1 + b4nm2)/dtau^2;


