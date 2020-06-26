 clf
%
load latetimedatatau43to1600L20Lmin100N128mu100c800.mat
%
taumI=areaah(:,1)>taum;
w = findw(areaah(taumI,1),areaah(taumI,4))
[a4real Ahreal2nd]=latetimefit(w,areaah(:,1));
%
tauI=2:length(areaah(:,1));
taufi=areaah(:,1)>1;
%
subplot(1,3,1);plot(areaah(tauI,1)*mu^(1/3),areaah(tauI,2)/mu^(1/3),'.','color','b'),hold on
xlabel \tau, ylabel 'r_h',title([' \tau_0 = ' num2str(areaah(1,1)*mu^(1/3))])
subplot(1,3,2);plot(areaah(tauI,1)*mu^(1/3),areaah(tauI,3)/mu^(2/3),'.','color','b'),hold on
               plot(areaah(taufi,1)*mu^(1/3),Ahreal2nd(taufi)/mu^(2/3),'-','color','r'),hold on
xlabel \tau, ylabel 'A_h',
subplot(1,3,3);plot(areaah(tauI,1)*mu^(1/3),-areaah(tauI,4)/mu^(4/3),'.','color','b'),hold on
               plot(areaah(taufi,1)*mu^(1/3),a4real(taufi)/mu^(4/3),'-','color','r'),hold on
xlabel \tau, ylabel '-a_4',
l01= ['\tau_0 = ' num2str(areaah(1,1)*mu^(1/3)) ', c = ' num2str(cbar)];
l02= ['Fit with w = ' num2str(w/mu^(1/3)) ];
%
load latetimedatatau43to1600L20Lmin100N128mu100c640
w = findw(areaah(taumI,1),areaah(taumI,4))%1.1014%0.485;
[a4real Ahreal2nd]=latetimefit(w,areaah(:,1));
%
subplot(1,3,1);plot(areaah(tauI,1)*mu^(1/3),areaah(tauI,2)/mu^(1/3),'.','color','g'),hold on
xlabel \tau, ylabel 'r_h',title([' \tau_0 = ' num2str(areaah(1,1)*mu^(1/3))])
subplot(1,3,2);plot(areaah(tauI,1)*mu^(1/3),areaah(tauI,3)/mu^(2/3),'.','color','g'),hold on
               plot(areaah(taufi,1)*mu^(1/3),Ahreal2nd(taufi)/mu^(2/3),'--','color','r'),hold on
xlabel \tau, ylabel 'A_h',
subplot(1,3,3);plot(areaah(tauI,1)*mu^(1/3),-areaah(tauI,4)/mu^(4/3),'.','color','g'),hold on
               plot(areaah(taufi,1)*mu^(1/3),a4real(taufi)/mu^(4/3),'--','color','r'),hold on
xlabel \tau, ylabel '-a_4',
l03= ['\tau_0 = ' num2str(areaah(1,1)*mu^(1/3)) ', c = ' num2str(cbar)];
l04= ['Fit with w = ' num2str(w/mu^(1/3)) ];
%
subplot(1,3,1);
legend(l01,l03,'location','NorthEast')
subplot(1,3,2);
legend(l01,l02,l03,l04,'location','SouthEast')
subplot(1,3,3);
legend(l01,l02,l03,l04,'location','NorthEast')

