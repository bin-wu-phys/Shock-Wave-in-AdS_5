 clf
%
load perturb/latetimedatatau200to16L20Lmin20N128H30mu010.mat
sf = 1/omega;
subplot(1,3,1);plot(areaah(:,1)/sf^(1/3),areaah(:,2)*sf^(1/3),'-','color','c'),hold on
subplot(1,3,2);plot(areaah(:,1)/sf^(1/3),areaah(:,3)*sf^(2/3),'-','color','c'),hold on
subplot(1,3,3);plot(areaah(:,1)/sf^(1/3),-areaah(:,4)*sf^(4/3),'-','color','c'),hold on
%
load ansatz/tau43.mat
sf = 1/omega;
subplot(1,3,1);plot(areaah(areaah(:,2)>0,1)/sf^(1/3),areaah(areaah(:,2)>0,2)*sf^(1/3),'-.','color','g'),hold on
subplot(1,3,2);plot(areaah(areaah(:,2)>0,1)/sf^(1/3),areaah(areaah(:,2)>0,3)*sf^(2/3),'-.','color','g'),hold on
subplot(1,3,3);plot(areaah(areaah(:,2)>0,1)/sf^(1/3),-areaah(areaah(:,2)>0,4)*sf^(4/3),'-.','color','g'),hold on
%
load ansatz/tau43cbar6p4.mat;
sf = 1/omega;
areaahold = areaah;
subplot(1,3,1);plot(areaah(areaah(:,2)>0,1)/sf^(1/3),areaah(areaah(:,2)>0,2)*sf^(1/3),'--','color','r'),hold on
xlabel \tau, ylabel 'r_h',
legend(['\tau_0 = ' num2str(2.0*0.01^(1/3))],['\tau_0 = 0.43, c = 8'],['\tau_0 = 0.43, c = 6.4'],'location','NorthEast')
subplot(1,3,2);plot(areaah(areaah(:,2)>0,1)/sf^(1/3),areaah(areaah(:,2)>0,3)*sf^(2/3),'--','color','r'),hold on
xlabel \tau, ylabel 'A_h',
legend(['\tau_0 = ' num2str(2.0*0.01^(1/3))],['\tau_0 = 0.43, c = 8'],['\tau_0 = 0.43, c = 6.4'],'location','NorthEast')
subplot(1,3,3);plot(areaah(areaah(:,2)>0,1)/sf^(1/3),-areaah(areaah(:,2)>0,4)*sf^(4/3),'--','color','r'),hold on
xlabel \tau, ylabel '-a_4',
legend(['\tau_0 = ' num2str(2.0*0.01^(1/3))],['\tau_0 = 0.43, c = 8'],['\tau_0 = 0.43, c = 6.4'],'location','NorthEast')

