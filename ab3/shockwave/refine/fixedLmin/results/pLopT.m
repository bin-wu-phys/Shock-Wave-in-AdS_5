    np=10;taufi=logspace(0,np,40);
    [pL pT] = pressurehydro(1,taufi);%pressure(areaah(:,1)*ru,areaah(:,4)/ru^4);
    loglog(taufi,1-pL./pT,'-.','color','r','LineWidth',2)
    xlabel '\tau w^{3/2}',ylabel '1-p_L./p_T'
  