 clf;
load latetimedatatau51to16L40Lmin20N256H30mu030;
areaahold = areaah;
subplot(1,3,1);plot(areaah(areaah(:,2)>0,1),areaah(areaah(:,2)>0,2),'.','color','blue'),hold on
subplot(1,3,2);plot(areaah(areaah(:,2)>0,1),areaah(areaah(:,2)>0,3),'.','color','blue'),hold on
subplot(1,3,3);plot(areaah(areaah(:,2)>0,1),-areaah(areaah(:,2)>0,4),'.','color','blue'),hold on
%
% load latetimedatatau100to16L20Lmin40N128H30mu1000cbar32.mat;
% areaahold = areaah;
% subplot(1,3,1);plot(areaah(:,1),areaah(:,2),':','color','blue'),hold on
% subplot(1,3,2);plot(areaah(:,1),areaah(:,3),':','color','blue'),hold on
% subplot(1,3,3);plot(areaah(:,1),-areaah(:,4),':','color','blue'),hold on
% %
% load latetimedatatau100to16L20Lmin30N128H30mu1000.mat;
% subplot(1,3,1);plot(areaah(:,1),areaah(:,2),'--','color','red'),hold on
% subplot(1,3,2);plot(areaah(:,1),areaah(:,3),'--','color','red'),hold on
% subplot(1,3,3);plot(areaah(:,1),-areaah(:,4),'--','color','red'),hold on
%
%2nd file
%
load latetimedatatau050to16L20Lmin20N128H30mu010.mat;
subplot(1,3,1);plot(areaah(:,1),areaah(:,2),'-','color','green')
xlabel \tau, ylabel 'r_h',
legend('N = 256, L = 40',' N = 128, L = 20','location','NorthEast')
title([ 'Relative Error = ' num2str(norm( (areaah(:,2)-areaahold(:,2))./areaah(:,2),inf ))])
%
subplot(1,3,2);plot(areaah(:,1),areaah(:,3),'-','color','green')
%axis([1 16 0.1 0.35])
xlabel \tau, ylabel 'A_h',
legend('N = 256, L = 40',' N = 128, L = 20','location','NorthEast')
title([ 'Relative Error = ' num2str(norm( (areaah(:,3)-areaahold(:,3))./areaah(:,3),inf ))])
%
subplot(1,3,3);plot(areaah(:,1),-areaah(:,4),'-','color','green')
xlabel \tau, ylabel '-a_4',
legend('N = 256, L = 40',' N = 128, L = 20','location','NorthEast')
title([ 'Relative Error = ' num2str(norm( (areaah(:,4)-areaahold(:,4))./areaah(:,4),inf ))])