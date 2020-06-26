 clf
%
load latetimedatatau200to16L20Lmin20N128H30mu010.mat
sf = 1/omega;
subplot(1,3,1);plot(areaah(:,1)/sf^(1/3),areaah(:,2)*sf^(1/3),'-','color','c'),hold on
subplot(1,3,2);plot(areaah(:,1)/sf^(1/3),areaah(:,3)*sf^(2/3),'-','color','c'),hold on
subplot(1,3,3);plot(areaah(:,1)/sf^(1/3),-areaah(:,4)*sf^(4/3),'-','color','c'),hold on
%
load latetimedatatau100to16L20Lmin20N128H30mu020.mat;
sf = 1/omega;
areaahold = areaah;
subplot(1,3,1);plot(areaah(:,1)/sf^(1/3),areaah(:,2)*sf^(1/3),'-.','color','blue'),hold on
subplot(1,3,2);plot(areaah(:,1)/sf^(1/3),areaah(:,3)*sf^(2/3),'-.','color','blue'),hold on
subplot(1,3,3);plot(areaah(:,1)/sf^(1/3),-areaah(:,4)*sf^(4/3),'-.','color','blue'),hold on
 %
load latetimedatatau100to16L20Lmin20N128H30mu010.mat;
sf = 1/omega;
areaahold = areaah;
subplot(1,3,1);plot(areaah(:,1)/sf^(1/3),areaah(:,2)*sf^(1/3),'--','color','red'),hold on
subplot(1,3,2);plot(areaah(:,1)/sf^(1/3),areaah(:,3)*sf^(2/3),'--','color','red'),hold on
subplot(1,3,3);plot(areaah(:,1)/sf^(1/3),-areaah(:,4)*sf^(4/3),'--','color','red'),hold on
%
%
load latetimedatatau100to16L20Lmin15N128H30mu005.mat
sf = 1/omega;
subplot(1,3,1);plot(areaah(:,1)/sf^(1/3),areaah(:,2)*sf^(1/3),':','color','g'),hold on
subplot(1,3,2);plot(areaah(:,1)/sf^(1/3),areaah(:,3)*sf^(2/3),':','color','g'),hold on
subplot(1,3,3);plot(areaah(:,1)/sf^(1/3),-areaah(:,4)*sf^(4/3),':','color','g'),hold on
 %
load latetimedatatau050to16L20Lmin20N128H30mu010.mat;
sf = 1/omega;
areaahold = areaah;
subplot(1,3,1);plot(areaah(:,1)/sf^(1/3),areaah(:,2)*sf^(1/3),'-','color','black'),hold on
xlabel \tau, ylabel 'r_h',
legend(['\tau_0 = ' num2str(2.0*0.01^(1/3))],['\tau_0 = ' num2str(1.0*0.02^(1/3))],['\tau_0 = ' num2str(1.0*0.01^(1/3))],['\tau_0 = ' num2str(1.0*0.005^(1/3))],['\tau_0 = ' num2str(0.5*0.01^(1/3))],'location','NorthEast')
subplot(1,3,2);plot(areaah(:,1)/sf^(1/3),areaah(:,3)*sf^(2/3),'-','color','black'),hold on
xlabel \tau, ylabel 'A_h',
legend(['\tau_0 = ' num2str(2.0*0.01^(1/3))],['\tau_0 = ' num2str(1.0*0.02^(1/3))],['\tau_0 = ' num2str(1.0*0.01^(1/3))],['\tau_0 = ' num2str(1.0*0.005^(1/3))],['\tau_0 = ' num2str(0.5*0.01^(1/3))],'location','SouthEast')
subplot(1,3,3);plot(areaah(:,1)/sf^(1/3),-areaah(:,4)*sf^(4/3),'-','color','black'),hold on
xlabel \tau, ylabel '-a_4',
legend(['\tau_0 = ' num2str(2.0*0.01^(1/3))],['\tau_0 = ' num2str(1.0*0.02^(1/3))],['\tau_0 = ' num2str(1.0*0.01^(1/3))],['\tau_0 = ' num2str(1.0*0.005^(1/3))],['\tau_0 = ' num2str(0.5*0.01^(1/3))],'location','SouthEast')

