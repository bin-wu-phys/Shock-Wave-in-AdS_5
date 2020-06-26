function tauc = tautherm( fn, percentcri )
%Find the thermalization time
%
load(fn);
taumI=areaah(:,1)>15;
w=findw(areaah(taumI,1),areaah(taumI,4));
tauI=areaah(:,1)>1;
%
tauc=(fzero(@(x)( abs(1 - spline( areaah(tauI,1),areaah(tauI,3),x)/fAhreal(w,x))-percentcri ),5)-areaah(1,1));

function Ahreal2nd = fAhreal(w,tau)
%
[a4real Ahreal2nd]=latetimefit(w,tau);

