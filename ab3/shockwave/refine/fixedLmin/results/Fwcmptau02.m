fn = {'1st/tau20cbar50.mat';'1st/tau20cbar60.mat';'1st/tau20cbar100.mat';'ansatz/tau20cbar16.mat';'ansatz/tau20cbar32.mat'};
%
clf;
larray=cell(length(fn)+1,1);lindex=1;
%
for m=1:length(fn)
    load(fn{m});
    Teff=(-areaah(:,4)).^(0.25)/pi;
    w=Teff.*areaah(:,1);
    larray{lindex}=['$\overline{c}$ = ' num2str(cbar)];
    lindex=lindex+1;
    Fw=areaah(:,1).*fnval(fnder(csape(areaah(:,1),w,'complete')),areaah(:,1));
    plot(w,Fw./w,'--','color',[1-(m-1)/(length(fn)-1) (m-1)/(length(fn)-1) 0],'LineWidth',2),hold on
end
%
w = 0.01:0.01:3.2;
Fwowhydro=2/3+1./(9*pi*w)+(1-log(2))./(27*pi^2*w.^2)+(15-2*pi^2-45*log(2)+24*log(2)^2)./(927*pi^3*w.^3);
larray{lindex}='$3^{rd}$ Hydro';
plot(w,Fwowhydro,'-.','color','b','LineWidth',2)
axis([0 1 0 1.8])
xlabel \omega,ylabel F(\omega)/\omega
h=legend(larray,'location','NorthEast');
set(h,'Interpreter','Latex');
