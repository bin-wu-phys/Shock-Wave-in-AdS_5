 clf;
%
fn = {'1st/tau100cbar25.mat';'ansatz/tau100cbar32.mat';'1st/tau100cbar45.mat';'ansatz/tau100cbar64.mat';'ansatz/tau100cbar128.mat'};
w=zeros(size(fn));
legendarray=cell(size(fn));
for m=1:length(fn)
    load(fn{m});
    taumI=areaah(:,1)>15;
    w(m)=findw(areaah(taumI,1),areaah(taumI,4))
    taufi=.5:.1:17;
    legendarray{m}=['c = ' num2str(cbar)];
%
    rgbc=[1-(m-1)/(length(fn)-1) (m-1)/(length(fn)-1) 0];
    subplot(1,2,1);plot(areaah(:,1),areaah(:,3),':','color',rgbc,'LineWidth',2),hold on
    subplot(1,2,2);plot(areaah(:,1),-areaah(:,4).*areaah(:,1).^(4/3),':','color',rgbc,'LineWidth',2),hold on
end
%
subplot(1,2,1);
xlabel \tau, ylabel 'A_h',
legend(legendarray,'location','SouthEast')
title( 'Entropy Density')
axis([0 20 2 3.7])
%
subplot(1,2,2);
xlabel \tau, ylabel '-a_4 \tau^{4/3}',
legend(legendarray,'location','SouthEast')
axis([0 20 1 5.8])
title( 'Energy Density')
%
for m=1:length(fn)
    [a4real Ahreal2nd]=latetimefit(w(m),taufi);
    subplot(1,2,1);plot(taufi,Ahreal2nd,'-','color','b'),text(16.5,Ahreal2nd(end)+.03,['w = ' num2str(w(m))]),hold on
    subplot(1,2,2);plot(taufi,a4real.*taufi.^(4/3),'-','color','b'),text(16.5,a4real(end)*taufi(end)^(4/3)+.07,['w = ' num2str(w(m))]),hold on
end
%
% [a4real Ahreal2nd]=latetimefit(w2,taufi);
% subplot(1,2,1);plot(taufi,Ahreal2nd,'-','color','m'),text(16.5,Ahreal2nd(end)+.03,['w = ' num2str(w2)]),hold on
% subplot(1,2,2);semilogy(taufi,a4real,'-','color','m'),text(16.5,a4real(end)+.005,['w = ' num2str(w2)]),hold on
% %
% [a4real Ahreal2nd]=latetimefit(w3,taufi);
% subplot(1,2,1);plot(taufi,Ahreal2nd,'-','color','m'),text(16.5,Ahreal2nd(end)+.03,['w = ' num2str(w3)]),hold on
% subplot(1,2,2);semilogy(taufi,a4real,'-','color','m'),text(16.5,a4real(end)+.005,['w = ' num2str(w3)]),hold on
