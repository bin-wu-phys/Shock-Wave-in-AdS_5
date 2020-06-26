clear,clf;
fn=dir('1st/tau20*.mat');
fnp=dir('ansatz/tau20*.mat');
n1=length(fn);n2=length(fnp);ntot=n1+n2;
la=cell(ntot+1,1);
taufi=.5:.1:30;
[a4real Ahreal2nd]=latetimefit(1,taufi);
%
subplot(1,2,1);plot(taufi,Ahreal2nd,'-','color','b'),hold on
xlabel \tau, ylabel 'A_h',
axis([0 8 0.4 1])
subplot(1,2,2);plot(taufi,a4real.*taufi.^(4/3),'-','color','b'),hold on
xlabel \tau, ylabel '-a_4 \tau^{4/3}',
axis([0 8 0 1])
la{1}='3^{rd} Hydro';nn=1;
%
%
for m=1:n1
    fname=['1st/' fn(m).name]
    load(fname);
    tauI=2:length(areaah(:,1));  
    taumI=areaah(:,1)>15;
    w = findw(areaah(taumI,1),areaah(taumI,4))
    ru = w^(3/2);
    la{m+1}=['\tau_0 = ' num2str(areaah(1,1)*mu^(1/3)) ', c = ' num2str(cbar) ', \tau_{0eff} = ' num2str(ru*areaah(1,1))];
    (tautherm( fname, 0.05 ))*ru
    lc=[m/ntot 1-m/ntot 0];
    subplot(1,2,1);plot(areaah(tauI,1)*ru,areaah(tauI,3)/ru^(2),'--','color',lc),hold on
    subplot(1,2,2);plot(areaah(tauI,1)*ru,-areaah(tauI,4).*areaah(tauI,1).^(4/3)/w^(4),'--','color',lc),hold on               
end
%
for m=1:n2
    fname=['ansatz/' fnp(m).name]
    load(fname);taumI=areaah(:,1)>15;
    tauI=2:length(areaah(:,1));  
    w = findw(areaah(taumI,1),areaah(taumI,4))
    ru = w^(3/2);
    la{1+n1+m}=['\tau_0 = ' num2str(areaah(1,1)*omega^(1/3)) ', c = ' num2str(cbar) ', \tau_{0eff} = ' num2str(ru*areaah(1,1))];
    (tautherm( fname, 0.05 ))*ru
    lc=[(m+n1)/ntot 1-(m+n1)/ntot 0];
    subplot(1,2,1);plot(areaah(tauI,1)*ru,areaah(tauI,3)/ru^(2),'--','color',lc ),hold on
    subplot(1,2,2);plot(areaah(tauI,1)*ru,-areaah(tauI,4).*areaah(tauI,1).^(4/3)/w^(4),'--','color',lc),hold on               
end
%
subplot(1,2,1);legend(la,'location','SouthEast');
subplot(1,2,2);legend(la,'location','SouthEast');