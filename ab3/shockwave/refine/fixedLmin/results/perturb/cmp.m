load latetimedatatau100to16L20Lmin30N128H30mu1000.mat
w = 1.4501;%1.1014%0.485;
Ahreal1st = w^3 - 0.5*w^2*areaah(:,1).^(-2/3);rhreal = w./areaah(:,1).^(1/3) - 0.5./areaah(:,1);
a4real = w^4./areaah(:,1).^(4/3) - 2*w^3./(3*areaah(:,1).^(6/3)) + (1 + 2*log(2))*w^2./(18*areaah(:,1).^(8/3));
lambda = (log(2)-1)/(6*w^2);Ahreal2nd = w^3 - 0.5*w^2*areaah(:,1).^(-2/3)+w*(4 + pi + 12*w^2*lambda + 4*log(2))*areaah(:,1).^(-4/3)/24;
clf;
areaI = area>0;
subplot(1,3,1);plot(areaah(:,1),areaah(:,3),'--',areaah(:,1),Ahreal2nd,'-.')
hold on
legend('Spectral','2nd','location','SouthEast');
xlabel \tau
ylabel 'A_h'
%title(['Error = ' num2str(norm((areaah(:,3)-spline(t(1:end-2),area(1:end-2),areaah(:,1)))./areaah(:,3),inf))])
%axis([4 20 0.9 1.15]);
%subplot(1,3,2);plot(areaah(:,1),-areaah(:,4),'--',areaah(:,1),a4real,'-.')
subplot(1,3,2);plot(areaah(:,1),-areaah(:,4).*areaah(:,1).^(4/3),'--',areaah(:,1),a4real.*areaah(:,1).^(4/3),'-')
%legend('CY','Spectral','1st','2nd','location','SouthEast');
xlabel \tau
ylabel '-a_4 \tau^{4/3}'
legend('Spectral','2nd','location','SouthEast')
%title(['Error = ' num2str(norm((areaah(:,4)-spline(t(1:end-2),A4(1:end-2),areaah(:,1)))./areaah(:,4),inf))])
%axis([4 20 0.9 1.20]);
%
subplot(1,3,3);plot(areaah(:,1),areaah(:,2),'--',areaah(:,1),rhreal,'-.')
%legend('CY','Spectral','1st','2nd','location','SouthEast');
xlabel \tau
ylabel 'r_h'
legend('Spectral','2nd','location','SouthEast')
%title(['Error = ' num2str(norm((areaah(:,2)-spline(t(1:end-2),1./Uh(1:end-2),areaah(:,1)))./areaah(:,2),inf))])
%axis([4 20 1 1.25]);
