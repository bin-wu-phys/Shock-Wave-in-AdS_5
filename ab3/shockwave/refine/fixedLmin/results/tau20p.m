 clf;
%
fn = {'1st/tau20cbar50.mat';'ansatz/tau20cbar32.mat'};
%
w=zeros(size(fn));
legendarray=cell(size(fn));
ru=0.5;
taufi=2:.1:17;
for m=1:length(fn)
    load(fn{m});
    taumI=areaah(:,1)>12;
    w(m)=findw(areaah(taumI,1),areaah(taumI,4))
    legendarray{m}=['$\overline{c}$ = ' num2str(cbar)];
%
    rgbc=[1-(m-1)/(length(fn)-1) (m-1)/(length(fn)-1) 0];
    [pL pT] = pressure(areaah(:,1)*ru,areaah(:,4)/ru^4);
    subplot(1,2,1);plot(areaah(:,1)*ru,pL./pT,'-.','color',rgbc,'LineWidth',2),hold on
    subplot(1,2,2);plot(areaah(:,1)*ru,pT,'-.','color',rgbc,'LineWidth',2),hold on
end
%
subplot(1,2,1);
xlabel '\tau \mu^{1/3}', ylabel 'p_L/p_T',
h1=legend(legendarray,'location','SouthEast')
set(h1, 'interpreter', 'latex');%
axis([0 9 -2 6.5])
%
subplot(1,2,2);
xlabel '\tau \mu^{1/3}', ylabel 'p_T \mu^{-4/3}',
h2=legend(legendarray,'location','NorthEast')
set(h2, 'interpreter', 'latex');%
axis([0 9 0 1.5])
%
for m=1:length(fn)
    [pL pT] = pressurehydro(w(m),taufi);%pressure(areaah(:,1)*ru,areaah(:,4)/ru^4);
    subplot(1,2,1);plot(taufi*ru,pL./pT,'-','color','b','LineWidth',1),hold on
    subplot(1,2,2);plot(taufi*ru,pT/ru^4,'-','color','b','LineWidth',1),hold on
end
sta=zeros(size(0:0.1:9))+1;
subplot(1,2,1);plot(0:0.1:9,sta,'--','color','b')
% for m=1:length(fn)
%     %
%     rgbc=[1-(m-1)/(length(fn)-1) (m-1)/(length(fn)-1) 0];
%     subplot(1,2,1);cbartab=load(fne{m});ci=cbartab<=0.201;
%                    plot(cbartab(ci,1),cbartab(ci,2),':','color',rgbc,'LineWidth',2),hold on
% end
%
% tau0=0:.01:0.5;a40=4*tau0.^2/3;
% subplot(1,2,2);plot(tau0,a40,'-','color','c','LineWidth',1),hold on