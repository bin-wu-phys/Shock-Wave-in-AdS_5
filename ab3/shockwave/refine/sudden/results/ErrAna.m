 clf;
load latetimedatatau090to16L20Lmin20N128H30mu100ti095.mat;
areaahold = areaah;
subplot(1,3,1);plot(areaah(:,1),areaah(:,2),'--','color','red'),hold on
subplot(1,3,2);plot(areaah(:,1),areaah(:,3),'--','color','red'),hold on
subplot(1,3,3);plot(areaah(:,1),-areaah(:,4),'--','color','red'),hold on
%
%2nd file
%
load latetimedatatau090to16L20Lmin20N128H30mu100ti100.mat;
subplot(1,3,1);plot(areaah(:,1),areaah(:,2),'-.','color','green')
xlabel \tau, ylabel 'r_h',
legend('\tau_i = 1.0, \tau_f = 1.2','\tau_i = 0.95, \tau_f = 1.2','location','SouthEast')
title([ 'Relative Error = ' num2str(norm( (areaah(:,2)-areaahold(:,2))/areaah(:,2),inf ))])
%
subplot(1,3,2);plot(areaah(:,1),areaah(:,3),'-.','color','green')
%axis([1 16 0.1 0.35])
xlabel \tau, ylabel 'A_h',
legend('\tau_i = 1.0, \tau_f = 1.2','\tau_i = 0.95, \tau_f = 1.2','location','SouthEast')
title([ 'Relative Error = ' num2str(norm( (areaah(:,3)-areaahold(:,3))/areaah(:,3),inf ))])
%
subplot(1,3,3);plot(areaah(:,1),-areaah(:,4),'-.','color','green')
xlabel \tau, ylabel '-a_4',
legend('\tau_i = 1.0, \tau_f = 1.2','\tau_i = 0.95, \tau_f = 1.2','location','SouthEast')
title([ 'Relative Error = ' num2str(norm( (areaah(:,4)-areaahold(:,4))/areaah(:,4),inf ))])