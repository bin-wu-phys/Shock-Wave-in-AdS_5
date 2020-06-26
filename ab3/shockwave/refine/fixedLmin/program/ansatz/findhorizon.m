function [rh area] = findhorizon(r, theta, s)
%find horizion given by theta(rh) = 0;
if sum(theta<0)==0
    rh = 0; area = 0;
else
    rh = fzero(@(rr)thetaf(rr,r,theta),1);
    area = spline(r,s,rh);
end

function thetapp = thetaf(rr, r, theta)
thetapp = spline(r,theta,rr);