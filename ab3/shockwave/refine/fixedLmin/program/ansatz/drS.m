function drSn=drS(dr,r,S)
%
%
np=3;
drSn=np*S./r+r.^np.*(dr*(S./r.^np));