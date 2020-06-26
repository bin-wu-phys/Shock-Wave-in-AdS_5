 clf
 %
load tau100cbar25dtau10;
sf = 1/mu;dtau3 = num2str(dtau);
areaahold = areaah;tauI=1:40:length(areaah(:,1));
subplot(1,3,1);plot(areaah(tauI,1)/sf^(1/3),areaah(tauI,2)*sf^(1/3),'o','color','m'),hold on
subplot(1,3,2);plot(areaah(tauI,1)/sf^(1/3),areaah(tauI,3)*sf^(2/3),'o','color','m'),hold on
subplot(1,3,3);plot(areaah(tauI,1)/sf^(1/3),-areaah(tauI,4)*sf^(4/3),'o','color','m'),hold on
%
load tau100cbar25dtau20;
sf = 1/mu;dtau3 = num2str(dtau);
areaahold = areaah;tauI=1:length(areaah(:,1));
subplot(1,3,1);plot(areaah(tauI,1)/sf^(1/3),areaah(tauI,2)*sf^(1/3),'.','color','r'),hold on
subplot(1,3,2);plot(areaah(tauI,1)/sf^(1/3),areaah(tauI,3)*sf^(2/3),'.','color','r'),hold on
subplot(1,3,3);plot(areaah(tauI,1)/sf^(1/3),-areaah(tauI,4)*sf^(4/3),'.','color','r'),hold on
%
load tau100cbar25dtau50;
sf = 1/mu;dtau3 = num2str(dtau);
areaahold = areaah;tauI=1:length(areaah(:,1));
subplot(1,3,1);plot(areaah(tauI,1)/sf^(1/3),areaah(tauI,2)*sf^(1/3),'*','color','b'),hold on
subplot(1,3,2);plot(areaah(tauI,1)/sf^(1/3),areaah(tauI,3)*sf^(2/3),'*','color','b'),hold on
subplot(1,3,3);plot(areaah(tauI,1)/sf^(1/3),-areaah(tauI,4)*sf^(4/3),'*','color','b'),hold on
%
load tau100cbar25;
sf = 1/mu;
subplot(1,3,1);plot(areaah(:,1)/sf^(1/3),areaah(:,2)*sf^(1/3),'-','color','g','LineWidth',1),hold on
xlabel \tau, ylabel 'r_h',
legend(['d\tau = ' dtau1], ['d\tau = ' dtau2],['d\tau = ' dtau3], ['d\tau = ' num2str(dtau)],'location','NorthEast')
subplot(1,3,2);plot(areaah(:,1)/sf^(1/3),areaah(:,3)*sf^(2/3),'-','color','g','LineWidth',1),hold on
xlabel \tau, ylabel 'A_h',title('c = 64')
legend(['d\tau = ' dtau1], ['d\tau = ' dtau2], ['d\tau = ' dtau3],['d\tau = ' num2str(dtau)],'location','NorthEast')
subplot(1,3,3);plot(areaah(:,1)/sf^(1/3),-areaah(:,4)*sf^(4/3),'-','color','g','LineWidth',1),hold on
xlabel \tau, ylabel '-a_4',
legend(['d\tau = ' dtau1], ['d\tau = ' dtau2], ['d\tau = ' dtau3],['d\tau = ' num2str(dtau)],'location','NorthEast')

