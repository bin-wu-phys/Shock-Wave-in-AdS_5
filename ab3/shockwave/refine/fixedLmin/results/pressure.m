function [pL pT] = pressure(tau,a4)
%Calculate p_L and p_T
%
a4p=tau.*fnval(fnder(csape(tau,a4,'complete')),tau);
pL=a4+a4p;
pT=-a4-0.5*a4p;
