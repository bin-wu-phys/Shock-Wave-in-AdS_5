 clf
%
load latetimedatatau43to1600L20Lmin100N128mu100c640
areaah=areaah(2:end,:);
sf = 1;
tauI=areaah(:,1)>taum;
w = findw(areaah(tauI,1),areaah(tauI,4))%1.1014%0.485;
Ahreal1st = w^3 - 0.5*w^2*areaah(:,1).^(-2/3);rhreal = w./areaah(:,1).^(1/3) - 0.5./areaah(:,1);
a4real = w^4./areaah(:,1).^(4/3) - 2*w^3./(3*areaah(:,1).^2) + (1 + 2*log(2))*w^2./(18*areaah(:,1).^(8/3));
lambda = (log(2)-1)/(6*w^2);Ahreal2nd = w^3 - 0.5*w^2*areaah(:,1).^(-2/3)+w*(4 + pi + 12*w^2*lambda + 4*log(2))*areaah(:,1).^(-4/3)/24;
subplot(1,3,1);plot(areaah(areaah(:,2)>0,1)/sf^(1/3),areaah(areaah(:,2)>0,2)*sf^(1/3),'--','color','b'),hold on
xlabel \tau, ylabel 'r_h',title([' \tau_0 = ' num2str(areaah(1,1)*mu^(1/3))])
subplot(1,3,2);plot(areaah(areaah(:,2)>0,1)/sf^(1/3),areaah(areaah(:,2)>0,3)*sf^(2/3),'--','color','b'),hold on
               plot(areaah(areaah(:,2)>0,1)/sf^(1/3),Ahreal2nd*sf^(2/3),'-','color','r'),hold on
xlabel \tau, ylabel 'A_h',
subplot(1,3,3);plot(areaah(areaah(:,2)>0,1)/sf^(1/3),-areaah(areaah(:,2)>0,4)*sf^(4/3),'--','color','b'),hold on
               plot(areaah(areaah(:,2)>0,1)/sf^(1/3),a4real*sf^(4/3),'-','color','r'),hold on
xlabel \tau, ylabel '-a_4',


