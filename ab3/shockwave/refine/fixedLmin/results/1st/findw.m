function w = findw(tau,a4)
w = fzero(@(x)fdE2(x,tau,a4),1);

function dE2 = fdE2(w,tau,a4)
%
%dE2=sum((-((4*w^2)./(27*tau.^(11/3)))+(4*w^3)./(3*tau.^3)-(4*w^4)./(3*tau.
%^(7/3))).*(w^2./(18*tau.^(8/3))-(2*w^3)./(3*tau.^2)+w^4./tau.^(4/3)+a4));
[a4real Ahreal da4real]=latetimefit(w,tau);
dE2=sum(da4real.*(a4real+a4));
