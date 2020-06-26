 clf;
load latetimedatatau10to16L20Lmin55N128H30mu1000cbar8.mat;
areaahold = areaah;
subplot(1,3,1);plot(areaah(areaah(:,2)>0,1),areaah(areaah(:,2)>0,2),':','color','blue'),hold on
subplot(1,3,2);plot(areaah(areaah(:,2)>0,1),areaah(areaah(:,2)>0,3),':','color','blue'),hold on
subplot(1,3,3);plot(areaah(areaah(:,2)>0,1),-areaah(areaah(:,2)>0,4),':','color','blue'),hold on
%
load latetimedatatau100to16L20Lmin40N128H30mu1000cbar32.mat;
areaahold = areaah;
subplot(1,3,1);plot(areaah(:,1),areaah(:,2),':','color','blue'),hold on
subplot(1,3,2);plot(areaah(:,1),areaah(:,3),':','color','blue'),hold on
subplot(1,3,3);plot(areaah(:,1),-areaah(:,4),':','color','blue'),hold on
%
load latetimedatatau100to16L20Lmin30N128H30mu1000.mat;
subplot(1,3,1);plot(areaah(:,1),areaah(:,2),'--','color','red'),hold on
subplot(1,3,2);plot(areaah(:,1),areaah(:,3),'--','color','red'),hold on
subplot(1,3,3);plot(areaah(:,1),-areaah(:,4),'--','color','red'),hold on
%
%2nd file
%
load latetimedatatau100to16L20Lmin30N128H30mu1000cbar128.mat;
subplot(1,3,1);plot(areaah(:,1),areaah(:,2),'-.','color','green')
xlabel \tau, ylabel 'r_h',
legend('c = 32',' c = 64','c = 128','location','NorthEast')
title([ 'Relative Error = ' num2str(norm( (areaah(:,2)-areaahold(:,2))/areaah(:,2),inf ))])
%
subplot(1,3,2);plot(areaah(:,1),areaah(:,3),'-.','color','green')
%axis([1 16 0.1 0.35])
xlabel \tau, ylabel 'A_h',
legend('c = 32',' c = 64','c = 128','location','SouthEast')
title([ 'Relative Error = ' num2str(norm( (areaah(:,3)-areaahold(:,3))/areaah(:,3),inf ))])
%
subplot(1,3,3);plot(areaah(:,1),-areaah(:,4),'-.','color','green')
xlabel \tau, ylabel '-a_4',
legend('c = 32',' c = 64','c = 128','location','NorthEast')
title([ 'Relative Error = ' num2str(norm( (areaah(:,4)-areaahold(:,4))/areaah(:,4),inf ))])