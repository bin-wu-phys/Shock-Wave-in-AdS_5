 clf
%
load 1st/latetimedatatau43to1600L20Lmin100N128mu100c800.mat
%
taumI=areaah(:,1)>15;
w = findw(areaah(taumI,1),areaah(taumI,4))
taufi=.5:.1:20;
[a4real Ahreal2nd]=latetimefit(w,taufi);
%
tauI=2:10:length(areaah(:,1));%[2:10:100 150:50:length(areaah(:,1))];
%
colp=2;
%subplot(1,3,1);plot(areaah(tauI,1)*mu^(1/3),areaah(tauI,2)/mu^(1/3),'.','color','b'),hold on
%xlabel \tau, ylabel 'r_h',title([' \tau_0 = ' num2str(areaah(1,1)*mu^(1/3))])
ru = w^(3/2);
subplot(1,colp,colp-1);
               plot(taufi*ru,Ahreal2nd/ru^(2),'-','color','r'),hold on
               plot(areaah(tauI,1)*ru,areaah(tauI,3)/ru^(2),'--','color','b'),hold on
xlabel \tau, ylabel 'A_h',
subplot(1,colp,colp);plot(taufi*ru,a4real.*taufi.^(4/3)/w^(4),'-','color','r'),hold on
                     plot(areaah(tauI,1)*ru,-areaah(tauI,4).*areaah(tauI,1).^(4/3)/w^(4),'--','color','b'),hold on
               
xlabel \tau, ylabel '-a_4 \tau^{4/3}',
l00= ['Latetime Fitting' ];%subplot(1,3,1);
l01= ['\tau_0 = ' num2str(areaah(1,1)*mu^(1/3)) ', \mu = ' num2str(mu)  ', c = ' num2str(cbar), ', w = ' num2str(w)];
%
load 1st/latetimedatatau43to1600L20Lmin100N128mu100c640
w = findw(areaah(taumI,1),areaah(taumI,4))%1.1014%0.485;
ru = w^(3/2);
%
%subplot(1,3,1);plot(areaah(tauI,1)*w^(1/3),areaah(tauI,2)/w^(1/3),'.','color','g'),hold on
%xlabel \tau, ylabel 'r_h',title([' \tau_0 = ' num2str(areaah(1,1)*w^(1/3))])
subplot(1,colp,colp-1);plot(areaah(tauI,1)*ru,areaah(tauI,3)/ru^(2),'-.','color','g'),hold on
subplot(1,colp,colp);plot(areaah(tauI,1)*ru,-areaah(tauI,4).*areaah(tauI,1).^(4/3)/w^(4),'-.','color','g'),hold on
l02= ['\tau_0 = ' num2str(areaah(1,1)*mu^(1/3)) ', \mu = ' num2str(mu)  ', c = ' num2str(cbar), ', w = ' num2str(w)];
%
%
load 1st/ansatz10to1600L20Lmin100N128mu100c400
w = findw(areaah(taumI,1),areaah(taumI,4))%1.1014%0.485;
ru = w^(3/2);
%
%subplot(1,3,1);plot(areaah(tauI,1)*w^(1/3),areaah(tauI,2)/w^(1/3),'.','color','g'),hold on
%xlabel \tau, ylabel 'r_h',title([' \tau_0 = ' num2str(areaah(1,1)*w^(1/3))])
subplot(1,colp,colp-1);plot(areaah(tauI,1)*ru,areaah(tauI,3)/ru^(2),'--','color','m'),hold on
subplot(1,colp,colp);plot(areaah(tauI,1)*ru,-areaah(tauI,4).*areaah(tauI,1).^(4/3)/w^(4),'--','color','m'),hold on
l03= ['\tau_0 = ' num2str(areaah(1,1)*mu^(1/3)) ', \mu = ' num2str(mu)  ', c = ' num2str(cbar), ', w = ' num2str(w)];
%
load 1st/ansatz27to1600L20Lmin100N128mu100c500
w = findw(areaah(taumI,1),areaah(taumI,4))%1.1014%0.485;
ru = w^(3/2);
%
subplot(1,colp,colp-1);plot(areaah(tauI,1)*ru,areaah(tauI,3)/ru^(2),'--','color','c'),hold on
subplot(1,colp,colp);plot(areaah(tauI,1)*ru,-areaah(tauI,4).*areaah(tauI,1).^(4/3)/w^(4),'-.','color','c'),hold on
l04= ['\tau_0 = ' num2str(areaah(1,1)*mu^(1/3)) ', \mu = ' num2str(mu)  ', c = ' num2str(cbar), ', w = ' num2str(w)];
%
load ansatz/latetimedatatau100to16L20Lmin30N128H30mu1000
mu=omega;
tauI=2:10:length(areaah(:,1));%[2:10:100 150:50:length(areaah(:,1))];
taumI=areaah(:,1)>15;
w = findw(areaah(taumI,1),areaah(taumI,4))%1.1014%0.485;
ru = w^(3/2);
%
subplot(1,colp,colp-1);plot(areaah(tauI,1)*ru,areaah(tauI,3)/ru^(2),':','color','r'),hold on
subplot(1,colp,colp);plot(areaah(tauI,1)*ru,-areaah(tauI,4).*areaah(tauI,1).^(4/3)/w^(4),'-.','color','c'),hold on
l05= ['\tau_0 = ' num2str(areaah(1,1)*mu^(1/3)) ', \mu = ' num2str(mu) ', c = 64', ', w = ' num2str(w)];
%
load ansatz/latetimedatatau100to16L20Lmin30N128H30mu1000cbar128
mu=omega;
tauI=2:10:length(areaah(:,1));%[2:10:100 150:50:length(areaah(:,1))];
taumI=areaah(:,1)>15;
w = findw(areaah(taumI,1),areaah(taumI,4))%1.1014%0.485;
ru = w^(3/2);
%
subplot(1,colp,colp-1);plot(areaah(tauI,1)*ru,areaah(tauI,3)/ru^(2),':','color','c'),hold on
subplot(1,colp,colp);plot(areaah(tauI,1)*ru,-areaah(tauI,4).*areaah(tauI,1).^(4/3)/w^(4),'-.','color','c'),hold on
l06= ['\tau_0 = ' num2str(areaah(1,1)*mu^(1/3)) ', \mu = ' num2str(mu)  ', c = 128', ', w = ' num2str(w)];
%
load ansatz/latetimedatatau100to16L20Lmin40N128H30mu1000cbar32;
mu=omega;
tauI=2:10:length(areaah(:,1));%[2:10:100 150:50:length(areaah(:,1))];
taumI=areaah(:,1)>15;
w = findw(areaah(taumI,1),areaah(taumI,4))%1.1014%0.485;
ru = w^(3/2);
%
subplot(1,colp,colp-1);plot(areaah(tauI,1)*ru,areaah(tauI,3)/ru^(2),':','color','b'),hold on
subplot(1,colp,colp);plot(areaah(tauI,1)*ru,-areaah(tauI,4).*areaah(tauI,1).^(4/3)/w^(4),'-.','color','c'),hold on
l07= ['\tau_0 = ' num2str(areaah(1,1)*mu^(1/3)) ', \mu = ' num2str(mu)  ', c = 32', ', w = ' num2str(w)];
%
subplot(1,colp,colp-1);
legend(l00,l01,l02,l03,l04,l05,l06,l07,'location','SouthEast')
axis([0 7 0.3 1.1])
subplot(1,colp,colp);
legend(l00,l01,l02,l03,l04,l05,l06,l07,'location','SouthEast')

