 clf
 %
load latetimedatatau100to1565L20Lmin100N128mu10c64001st;
sf = 1/mu; dtau1 = num2str(dtau);
subplot(1,3,1);plot(areaah(:,1)/sf^(1/3),areaah(:,2)*sf^(1/3),'.','color','red'),hold on
subplot(1,3,2);plot(areaah(:,1)/sf^(1/3),areaah(:,3)*sf^(2/3),'.','color','red'),hold on
subplot(1,3,3);plot(areaah(:,1)/sf^(1/3),-areaah(:,4)*sf^(4/3),'.','color','red'),hold on
%
load latetimedatatau100to495L20Lmin100N128mu100c6400.mat;
sf = 1/mu;dtau2 = num2str(dtau);
areaahold = areaah;
subplot(1,3,1);plot(areaah(:,1)/sf^(1/3),areaah(:,2)*sf^(1/3),'*','color','b'),hold on
subplot(1,3,2);plot(areaah(:,1)/sf^(1/3),areaah(:,3)*sf^(2/3),'*','color','b'),hold on
subplot(1,3,3);plot(areaah(:,1)/sf^(1/3),-areaah(:,4)*sf^(4/3),'*','color','b'),hold on
%
load latetimedatatau100to15L20Lmin20N128mu10c6400H30.mat;
sf = 1/mu;
subplot(1,3,1);plot(areaah(:,1)/sf^(1/3),areaah(:,2)*sf^(1/3),'-.','color','g'),hold on
xlabel \tau, ylabel 'r_h',
legend(['datu = ' dtau1], ['datu = ' dtau2], 'Lmin Fixed','location','NorthEast')
subplot(1,3,2);plot(areaah(:,1)/sf^(1/3),areaah(:,3)*sf^(2/3),'-.','color','g'),hold on
xlabel \tau, ylabel 'A_h',title('c = 64')
legend(['datu = ' dtau1], ['datu = ' dtau2], 'Lmin Fixed','location','NorthEast')
subplot(1,3,3);plot(areaah(:,1)/sf^(1/3),-areaah(:,4)*sf^(4/3),'-.','color','g'),hold on
xlabel \tau, ylabel '-a_4',
legend(['datu = ' dtau1], ['datu = ' dtau2], 'Lmin Fixed','location','NorthEast')

