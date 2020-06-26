fn02=dir('ansatz/tau20*.mat');
fn=dir('1st/tau20*.mat');
%
clf;
larray=cell(length(fn)+length(fn02),1);lindex=1;
%
for m=1:length(fn)
    fname=['1st/' fn(m).name];
    load(fname);
    Teff=(-areaah(:,4)).^(0.25)/pi;
    w=Teff.*areaah(:,1);
    larray{lindex}=['\tau_0 = ' num2str(mu^(1/3)*areaah(1,1)) ', \mu = ' num2str(omega) ', c = ' num2str(cbar)];
    lindex=lindex+1;
    Fw=areaah(:,1).*fnval(fnder(csape(areaah(:,1),w,'complete')),areaah(:,1));
    plot(w,Fw./w,'--','color',[omega^(1/3)*areaah(1,1)/1.1 (cbar-16)/112 1],'LineWidth',2),hold on
end
%
for m=1:length(fn02)
    fname=['ansatz/' fn02(m).name];
    load(fname);
    Teff=(-areaah(:,4)).^(0.25)/pi;
    w=Teff.*areaah(:,1);
    larray{lindex}=['\tau_0 = ' num2str(omega^(1/3)*areaah(1,1)) ', \mu = ' num2str(omega) ', c = ' num2str(cbar)];
    lindex=lindex+1;
    Fw=areaah(:,1).*fnval(fnder(csape(areaah(:,1),w,'complete')),areaah(:,1));
    plot(w,Fw./w,'--','color',[m/length(fn) 1- m/length(fn) 0],'LineWidth',2),hold on
end
w = 0.01:0.01:3.2;
Fwowhydro=2/3+1./(9*pi*w)+(1-log(2))./(27*pi^2*w.^2)+(15-2*pi^2-45*log(2)+24*log(2)^2)./(927*pi^3*w.^3);
plot(w,Fwowhydro,'-.','color','g','LineWidth',2)
axis([0 1 0 1.8])
xlabel \omega,ylabel F(\omega)/\omega
legend(larray,'location','NorthEast')
