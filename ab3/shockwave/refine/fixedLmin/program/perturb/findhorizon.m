function [rh area] = findhorizon(r, rhold,theta, s)
%find horizion given by theta(rh) = 0;
rh = fzero(@(rr)thetaf(rr,r,theta),rhold);
area = spline(r,s,rh);

function thetapp = thetaf(rr, r, theta)
thetapp = spline(r,theta,rr);