 clf
 %
load latetimedatatau100to16L20Lmin30N128H30mu050;
sf = 1/omega;
subplot(1,3,1);plot(areaah(:,1)/sf^(1/3),areaah(:,2)*sf^(1/3),'-.','color','red'),hold on
subplot(1,3,2);plot(areaah(:,1)/sf^(1/3),areaah(:,3)*sf^(2/3),'-.','color','red'),hold on
subplot(1,3,3);plot(areaah(:,1)/sf^(1/3),-areaah(:,4)*sf^(4/3),'-.','color','red'),hold on
%
load latetimedatatau100to16L20Lmin30N128H30mu500.mat;
sf = 1/omega;
areaahold = areaah;
subplot(1,3,1);plot(areaah(:,1)/sf^(1/3),areaah(:,2)*sf^(1/3),'-.','color','b'),hold on
subplot(1,3,2);plot(areaah(:,1)/sf^(1/3),areaah(:,3)*sf^(2/3),'-.','color','b'),hold on
subplot(1,3,3);plot(areaah(:,1)/sf^(1/3),-areaah(:,4)*sf^(4/3),'-.','color','b'),hold on
%
load latetimedatatau100to16L20Lmin30N128H30mu1000.mat;
sf = 1/omega;
subplot(1,3,1);plot(areaah(:,1)/sf^(1/3),areaah(:,2)*sf^(1/3),'-.','color','g'),hold on
xlabel \tau, ylabel 'r_h',
legend(['\tau_0 = ' num2str(0.05^(1/3))],['\tau_0 = ' num2str(0.5^(1/3))],['\tau_0 = 1.0'],'location','NorthEast')
subplot(1,3,2);plot(areaah(:,1)/sf^(1/3),areaah(:,3)*sf^(2/3),'-.','color','g'),hold on
xlabel \tau, ylabel 'A_h',title('c = 64')
legend(['\tau_0 = ' num2str(0.05^(1/3))],['\tau_0 = ' num2str(0.5^(1/3))],['\tau_0 = 1.0'],'location','SouthEast')
subplot(1,3,3);plot(areaah(:,1)/sf^(1/3),-areaah(:,4)*sf^(4/3),'-.','color','g'),hold on
xlabel \tau, ylabel '-a_4',
legend(['\tau_0 = ' num2str(0.05^(1/3))],['\tau_0 = ' num2str(0.5^(1/3))],['\tau_0 = 1.0'],'location','NorthEast')
