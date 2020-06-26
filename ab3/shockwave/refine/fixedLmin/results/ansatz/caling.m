 clf;
load latetimedatatau100to16L20Lmin30N128H30mu050.mat;
sf = 1;
subplot(2,3,1);plot(areaah(:,1)/sf^(1/3),areaah(:,2)*sf^(1/3),'--','color','red'),hold on
title('Before scaling')
subplot(2,3,2);plot(areaah(:,1)/sf^(1/3),areaah(:,3)*sf^(2/3),'--','color','red'),hold on
subplot(2,3,3);plot(areaah(:,1)/sf^(1/3),-areaah(:,4)*sf^(4/3),'--','color','red'),hold on
%
sf = 1/omega;
subplot(2,3,4);plot(areaah(:,1)/sf^(1/3),areaah(:,2)*sf^(1/3),'--','color','red'),hold on
title('After scaling')
subplot(2,3,5);plot(areaah(:,1)/sf^(1/3),areaah(:,3)*sf^(2/3),'--','color','red'),hold on
subplot(2,3,6);plot(areaah(:,1)/sf^(1/3),-areaah(:,4)*sf^(4/3),'--','color','red'),hold on
%
load latetimedatatau100to16L20Lmin30N128H30mu500.mat;
sf = 1;
subplot(2,3,1);plot(areaah(:,1)/sf^(1/3),areaah(:,2)*sf^(1/3),'--','color','blue'),hold on
subplot(2,3,2);plot(areaah(:,1)/sf^(1/3),areaah(:,3)*sf^(2/3),'--','color','blue'),hold on
subplot(2,3,3);plot(areaah(:,1)/sf^(1/3),-areaah(:,4)*sf^(4/3),'--','color','blue'),hold on
%
sf = 1/omega;
subplot(2,3,4);plot(areaah(:,1)/sf^(1/3),areaah(:,2)*sf^(1/3),'--','color','blue'),hold on
subplot(2,3,5);plot(areaah(:,1)/sf^(1/3),areaah(:,3)*sf^(2/3),'--','color','blue'),hold on
subplot(2,3,6);plot(areaah(:,1)/sf^(1/3),-areaah(:,4)*sf^(4/3),'--','color','blue'),hold on
%

%2nd file
%
load latetimedatatau100to16L20Lmin30N128H30mu1000.mat;
subplot(2,3,1);plot(areaah(:,1),areaah(:,2),'-.','color','green')
xlabel \tau, ylabel 'r_h',
legend('\mu = 0.05','\mu = 0.5','\mu = 1','location','NorthEast')
%title([ 'Relative Error = ' num2str(norm( (areaah(:,2)-areaahold(:,2))/areaah(:,2),inf ))])
%
subplot(2,3,2);plot(areaah(:,1),areaah(:,3),'-.','color','green')
xlabel \tau, ylabel 'A_h',
legend('\mu = 0.05','\mu = 0.5','\mu = 1','location','SouthEast')
%title([ 'Relative Error = ' num2str(norm( (areaah(:,3)-areaahold(:,3))/areaah(:,3),inf ))])
%
subplot(2,3,3);plot(areaah(:,1),-areaah(:,4),'-.','color','green')
xlabel \tau, ylabel 'a_4',
legend('\mu = 0.05','\mu = 0.5','\mu = 1','location','NorthEast')
%title([ 'Relative Error = ' num2str(norm( (areaah(:,4)-areaahold(:,4))/areaah(:,4),inf ))])title([ 'Relative Error = ' num2str(norm( (areaah(:,3)-areaahold(:,3))/areaah(:,3),inf ))])
subplot(2,3,4);plot(areaah(:,1),areaah(:,2),'-.','color','green')
xlabel tau, ylabel 'r_h',
legend('\mu = 0.05','\mu = 0.5','\mu = 1','location','NorthEast')
%title([ 'Relative Error = ' num2str(norm( (areaah(:,2)-areaahold(:,2))/areaah(:,2),inf ))])
%
subplot(2,3,5);plot(areaah(:,1),areaah(:,3),'-.','color','green')
xlabel \tau, ylabel 'A_h',
legend('\mu = 0.05','\mu = 0.5','\mu = 1','location','SouthEast')
%title([ 'Relative Error = ' num2str(norm( (areaah(:,3)-areaahold(:,3))/areaah(:,3),inf ))])
%
subplot(2,3,6);plot(areaah(:,1),-areaah(:,4),'-.','color','green')
xlabel \tau, ylabel 'a_4',
legend('\mu = 0.05','\mu = 0.5','\mu = 1','location','NorthEast')
%title([ 'Relative Error = ' num2str(norm(
%(areaah(:,4)-areaahold(:,4))/areaah(:,4),inf ))])title([ 'Relative Error = ' num2str(norm( (areaah(:,3)-areaahold(:,3))/areaah(:,3),inf ))])