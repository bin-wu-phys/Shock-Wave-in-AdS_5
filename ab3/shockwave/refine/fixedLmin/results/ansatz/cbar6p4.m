 clf
%
%
load tau27cbar6p4.mat;
sf = 1/omega;
areaahold = areaah;
subplot(1,3,1);plot(areaah(:,1)/sf^(1/3),areaah(:,2)*sf^(1/3),'-.','color','blue'),hold on
subplot(1,3,2);plot(areaah(:,1)/sf^(1/3),areaah(:,3)*sf^(2/3),'-.','color','blue'),hold on
subplot(1,3,3);plot(areaah(:,1)/sf^(1/3),-areaah(:,4)*sf^(4/3),'-.','color','blue'),hold on
%
load tau43cbar6p4.mat;
sf = 1/omega;
areaahold = areaah;
subplot(1,3,1);plot(areaah(:,1)/sf^(1/3),areaah(:,2)*sf^(1/3),'-','color','black'),hold on
xlabel \tau, ylabel 'r_h',
legend('\tau_0 = 0.27' ,'\tau_0 = 0.43','location','NorthEast')
subplot(1,3,2);plot(areaah(:,1)/sf^(1/3),areaah(:,3)*sf^(2/3),'-','color','black'),hold on
xlabel \tau, ylabel 'A_h',
legend('\tau_0 = 0.27' ,'\tau_0 = 0.43','location','NorthEast')
subplot(1,3,3);plot(areaah(:,1)/sf^(1/3),-areaah(:,4)*sf^(4/3),'-','color','black'),hold on
xlabel \tau, ylabel '-a_4',
legend('\tau_0 = 0.27' ,'\tau_0 = 0.43','location','NorthEast')

