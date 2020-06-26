 clf
%
load 1st/latetimedatatau43to1600L20Lmin100N128mu100c800.mat
subplot(1,3,1);plot(areaah(:,1)*mu^(1/3),areaah(:,2)/mu^(1/3),'*','color','c'),hold on
subplot(1,3,2);plot(areaah(:,1)*mu^(1/3),areaah(:,3)/mu^(2/3),'*','color','c'),hold on
subplot(1,3,3);plot(areaah(:,1)*mu^(1/3),-areaah(:,4)/mu^(4/3),'*','color','c'),hold on
l01= ['\tau_0 = ' num2str(areaah(1,1)*mu^(1/3)) ', c = ' num2str(cbar)];
%
load ansatz/tau43.mat
subplot(1,3,1);plot(areaah(areaah(:,2)>0,1)*omega^(1/3),areaah(areaah(:,2)>0,2)/omega^(1/3),'-.','color','b'),hold on
subplot(1,3,2);plot(areaah(areaah(:,2)>0,1)*omega^(1/3),areaah(areaah(:,2)>0,3)/omega^(2/3),'-.','color','b'),hold on
subplot(1,3,3);plot(areaah(areaah(:,2)>0,1)*omega^(1/3),-areaah(areaah(:,2)>0,4)/omega^(4/3),'-.','color','b'),hold on
l02= ['\tau_0 = ' num2str((areaah(1,1)-deltat)*omega^(1/3)) ', c = ' num2str(cbar)];
%
%
load 1st/latetimedatatau43to1600L20Lmin100N128mu100c640
sf = mu;
w = 1.35;%1.1014%0.485;
%Ahreal1st = w^3 - 0.5*w^2*areaah(:,1).^(-2/3);rhreal = w./areaah(:,1).^(1/3) - 0.5./areaah(:,1);
a4real = w^4./areaah(:,1).^(4/3) - 2*w^3./(3*areaah(:,1).^(6/3)) + (1 + 2*log(2))*w^2./(18*areaah(:,1).^(8/3));
lambda = (log(2)-1)/(6*w^2);Ahreal2nd = w^3 - 0.5*w^2*areaah(:,1).^(-2/3)+w*(4 + pi + 12*w^2*lambda + 4*log(2))*areaah(:,1).^(-4/3)/24;
subplot(1,3,1);plot(areaah(areaah(:,2)>0,1)/sf^(1/3),areaah(areaah(:,2)>0,2)*sf^(1/3),'.','color','g'),hold on
subplot(1,3,2);plot(areaah(areaah(:,2)>0,1)/sf^(1/3),areaah(areaah(:,2)>0,3)*sf^(2/3),'.','color','g'),hold on
               plot(areaah(areaah(:,2)>0,1)/sf^(1/3),Ahreal2nd*sf^(2/3),'-','color','black'),hold on
subplot(1,3,3);plot(areaah(areaah(:,2)>0,1)/sf^(1/3),-areaah(areaah(:,2)>0,4)*sf^(4/3),'.','color','g'),hold on
               plot(areaah(areaah(:,2)>0,1)/sf^(1/3),-a4real*sf^(4/3),'-','color','black'),hold on
l03= ['\tau_0 = ' num2str(areaah(1,1)*mu^(1/3)) ', c = ' num2str(cbar)];
%
load ansatz/tau43cbar6p4.mat;
l04= ['\tau_0 = ' num2str((areaah(1,1)-deltat)*omega^(1/3)) ', c = ' num2str(cbar)];
sf = 1/omega;
areaahold = areaah;
subplot(1,3,1);plot(areaah(areaah(:,2)>0,1)/sf^(1/3),areaah(areaah(:,2)>0,2)*sf^(1/3),'--','color','r'),hold on
xlabel \tau, ylabel 'r_h',
legend(l01,l02,l03,l04,'location','NorthEast')
subplot(1,3,2);plot(areaah(areaah(:,2)>0,1)/sf^(1/3),areaah(areaah(:,2)>0,3)*sf^(2/3),'--','color','r'),hold on
xlabel \tau, ylabel 'A_h',
legend(l01,l02,l03,l04,'location','NorthEast')
subplot(1,3,3);plot(areaah(areaah(:,2)>0,1)/sf^(1/3),-areaah(areaah(:,2)>0,4)*sf^(4/3),'--','color','r'),hold on
xlabel \tau, ylabel '-a_4',
legend(l01,l02,l03,l04,'location','NorthEast')

