 clf;
%
%fn = {'ansatz/tau20cbar16.mat';'ansatz/tau30cbar16.mat';'ansatz/tau100cbar16.mat'};
%fn={'1st/tau10cbar60.mat';'1st/tau20cbar60.mat'};
fn = {'1st/tau43cbar80.mat';'1st/tau100cbar80.mat'};

w=zeros(size(fn));ru=w;
legendarray=cell(size(fn));
for m=1:length(fn)
    load(fn{m});
    taumI=areaah(:,1)>12;omega=mu;
    w(m)=findw(areaah(taumI,1),areaah(taumI,4))
    ru(m)=omega^(1/3);
    legendarray{m}=['\tau_0 = ' num2str(areaah(1,1)*ru(m)) ', c = ' num2str(cbar)];
%
    rgbc=[1-(m-1)/(length(fn)-1) (m-1)/(length(fn)-1) 0];
    subplot(1,2,1);plot(areaah(:,1)*ru(m),areaah(:,3)/ru(m)^2,':','color',rgbc,'LineWidth',2),hold on
    subplot(1,2,2);plot(areaah(:,1)*ru(m),-areaah(:,4)/ru(m)^(12/3),':','color',rgbc,'LineWidth',2),hold on
end
%
subplot(1,2,1);
xlabel \tau, ylabel 'A_h',
legend(legendarray,'location','SouthEast')
title( 'Entropy Density')
%axis([0 9 0.4 1.6])
%
subplot(1,2,2);
xlabel \tau, ylabel '-a_4',
legend(legendarray,'location','NorthEast')
%axis([0 9 0 1.1])
title( 'Energy Density')
%
taufi=1:.1:17;
for m=1:length(fn)
    [a4real Ahreal2nd]=latetimefit(w(m),taufi);
    subplot(1,2,1);plot(taufi*ru(m),Ahreal2nd/ru(m)^2,'-','color','b'),text(7,Ahreal2nd(end)/ru(m)^2+.01,['w = ' num2str(w(m)/ru(m)^(2/3))]),hold on
    subplot(1,2,2);plot(taufi*ru(m),a4real/ru(m)^(12/3),'-','color','b'),text(4,a4real(floor(end/2))/ru(m)^4+.02,['w = ' num2str(w(m)/ru(m)^(2/3))]),hold on
end
cbar16tab=load('cbar6.dat');
subplot(1,2,1);plot(cbar16tab(:,1),cbar16tab(:,2),'-','color','c','LineWidth',1),hold on
tau0=0:.01:1;a40=4*tau0.^2/3;
subplot(1,2,2);plot(tau0,a40,'-','color','c','LineWidth',1),hold on