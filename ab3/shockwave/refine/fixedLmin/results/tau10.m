 clf
%
load 1st/latetimedatatau100to1600L20Lmin100N128mu0c430
sf = 1/mu;
subplot(1,3,1);plot(areaah(areaah(:,2)>0,1)/sf^(1/3),areaah(areaah(:,2)>0,2)*sf^(1/3),'.','color','c'),hold on
subplot(1,3,2);plot(areaah(areaah(:,2)>0,1)/sf^(1/3),areaah(areaah(:,2)>0,3)*sf^(2/3),'.','color','c'),hold on
subplot(1,3,3);plot(areaah(areaah(:,2)>0,1)/sf^(1/3),-areaah(areaah(:,2)>0,4)*sf^(4/3),'.','color','c'),hold on
l01= ['\tau_0 = ' num2str(areaah(1,1)*mu^(1/3)) ', c = ' num2str(cbar)];
 %
load ansatz/latetimedatatau10to16L20Lmin55N128H30mu1000cbar8
sf = 1/omega;cbar=8;
subplot(1,3,1);plot(areaah(areaah(:,2)>0,1)/sf^(1/3),areaah(areaah(:,2)>0,2)*sf^(1/3),'-','color','c'),hold on
subplot(1,3,2);plot(areaah(areaah(:,2)>0,1)/sf^(1/3),areaah(areaah(:,2)>0,3)*sf^(2/3),'-','color','c'),hold on
subplot(1,3,3);plot(areaah(areaah(:,2)>0,1)/sf^(1/3),-areaah(areaah(:,2)>0,4)*sf^(4/3),'-','color','c'),hold on
l02= ['\tau_0 = ' num2str((areaah(1,1)-deltat)*omega^(1/3)) ', c = ' num2str(cbar)];
 %
 cbar=0;
load perturb/latetimedatatau050to16L20Lmin20N128H30mu010.mat;
l03= ['\tau_0 = ' num2str((areaah(1,1)-deltat)*omega^(1/3)) ', c = ' num2str(cbar)];
sf = 1/omega;
areaahold = areaah;
subplot(1,3,1);plot(areaah(:,1)/sf^(1/3),areaah(:,2)*sf^(1/3),'-','color','black'),hold on
xlabel \tau, ylabel 'r_h',
legend(l01,l02,l03,'location','NorthEast')
subplot(1,3,2);plot(areaah(:,1)/sf^(1/3),areaah(:,3)*sf^(2/3),'-','color','black'),hold on
xlabel \tau, ylabel 'A_h',
legend(l01,l02,l03,'location','NorthEast')
subplot(1,3,3);plot(areaah(:,1)/sf^(1/3),-areaah(:,4)*sf^(4/3),'-','color','black'),hold on
xlabel \tau, ylabel '-a_4',
legend(l01,l02,l03,'location','NorthEast')

