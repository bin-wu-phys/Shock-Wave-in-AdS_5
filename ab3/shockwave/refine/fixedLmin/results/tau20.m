 clf;
%
fn = {'1st/tau20cbar50.mat';'1st/tau20cbar60.mat';'1st/tau20cbar100.mat';'ansatz/tau20cbar16.mat';'ansatz/tau20cbar32.mat'};
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
    subplot(1,3,1);plot(areaah(:,1)*ru,areaah(:,3)/ru^2,'-.','color',rgbc,'LineWidth',2),hold on
    subplot(1,3,2);plot(areaah(:,1)*ru,-areaah(:,4)/ru^(12/3),'-.','color',rgbc,'LineWidth',2),hold on
end
%
subplot(1,3,1);
xlabel('$\tau$ $\overline{\mu}^{1/3}$','Interpreter','LaTex'), ylabel('$A_h\overline{\mu}^{-2/3}$','Interpreter','LaTex'),
h1=legend(legendarray,'location','SouthEast')
set(h1, 'interpreter', 'latex');%
title( 'Entropy Density')
axis([0 9 0 1.8])
%
subplot(1,3,2);
xlabel('$\tau$ $\overline{\mu}^{1/3}$','Interpreter','LaTex'),ylabel('$-a_4 \overline{\mu}^{-4/3}$','Interpreter','LaTex'),
h2=legend(legendarray,'location','NorthEast')
set(h2, 'interpreter', 'latex');%
axis([0 9 0 1.1])
title( 'Energy Density')
%
for m=1:length(fn)
    [a4real Ahreal2nd]=latetimefit(w(m),taufi);
    subplot(1,3,1);plot(taufi*ru,Ahreal2nd/ru^2,'-','color','b'),text(7,Ahreal2nd(end)/ru^2+.03,['w = ' num2str(w(m)/ru^(2/3))]),hold on
    subplot(1,3,2);plot(taufi*ru,a4real/ru^(12/3),'-','color','b')%,text(4,a4real(floor(end/2.2))/ru^4+.02,['w = ' num2str(w(m)/ru^(2/3))]),hold on
end
%
fn = {'1st/tau20cbar50.mat'};
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
    [pL pT] = pressure(areaah(:,1),areaah(:,4));
    subplot(1,3,3);plot(areaah(:,1)*ru,-3*pT./areaah(:,4),'-.','color','r','LineWidth',2),hold on
    subplot(1,3,3);plot(areaah(:,1)*ru,-3*pL./areaah(:,4),'--','color','g','LineWidth',2),hold on
end
%
subplot(1,3,3);
title( 'Pressure')
xlabel('$\tau \overline{\mu}^{1/3}$','Interpreter','LaTex'),
h3=legend('$p_T$ with $\overline{c}$ = 5','$p_L$ with $\overline{c}$ = 5','location','NorthEast')
set(h3, 'interpreter', 'latex');%
%axis([0 9 -2.1 1.5])
%
tautab=0:0.2:18;
ideal=ones(size(tautab));
for m=1:length(fn)
    [pL pT] = pressurehydro(w(m),taufi);%pressure(areaah(:,1)*ru,areaah(:,4)/ru^4);
    [a4real Ahreal]=latetimefit(w(m),taufi);
    subplot(1,3,3);plot(taufi*ru,3*pT./a4real,'-','color','b','LineWidth',1),hold on
    subplot(1,3,3);plot(taufi*ru,3*pL./a4real,'-','color','b','LineWidth',1),hold on
    subplot(1,3,3);plot(tautab*ru,ideal,'-','color','b','LineWidth',1),hold on

end
