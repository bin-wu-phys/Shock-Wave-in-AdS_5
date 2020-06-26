function [rh area] = findhorizon(r, theta, s)
%find horizion given by theta(rh) = 0;
rh = fzero(@(rr)thetaf(rr,r,theta),r(end));
area = spline(r,s,rh);

function thetapp = thetaf(rr, r, theta)
thetapp = spline(r,theta,rr);