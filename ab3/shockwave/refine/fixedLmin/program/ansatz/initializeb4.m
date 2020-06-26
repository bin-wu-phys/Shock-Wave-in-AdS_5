function [ b4 b4t1 b4t2 b4nm1 b4nm2] = initializeb4( tau,dtau,mu)
%Initilize a4
%
b4 = ( 1 + 10*mu^2*tau^6 )/(6*tau^4);
b4t1 = 2*(-1+5*mu^2*tau^6)/(3*tau^5);
b4t2 = (10/3)*(1/tau^6 + mu^2);
%
b4nm1 = b4 - dtau*b4t1;
b4nm2 = -b4 +b4t2*dtau^2 + 2*b4nm1;
%
%tau = tau - dtau;b4nm1 = ( 1 + 10*mu^2*tau^6 )/(6*tau^4);
end

