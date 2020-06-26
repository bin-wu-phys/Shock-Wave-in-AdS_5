load shockwavecymu01.mat
%
aI = area>0;tI=t(aI);
w = 0.58;%0.808;
Ahreal1st = w^3 - 0.5*w^2*tI.^(-2/3);rhreal = w./tI.^(1/3) - 0.5./tI;
a4real = w^4./tI.^(4/3) - 2*w^3./(3*tI.^(6/3)) + (1 + 2*log(2))*w^2./(18*tI.^(8/3));
lambda = (log(2)-1)/(6*w^2);Ahreal2nd = w^3 - 0.5*w^2*tI.^(-2/3)+w*(4 + pi + 12*w^2*lambda + 4*log(2))*tI.^(-4/3)/24;
clf;
%
subplot(1,3,1);plot(tI,area(aI),'--',tI,Ahreal2nd,'-')
hold on
legend('CY','2nd','location','SouthEast');
xlabel \tau
ylabel 'A_h'
%title(['Error = ' num2str(norm((areaah(:,3)-spline(t(1:end-2),area(1:end-2),areaah(:,1)))./areaah(:,3),inf))])
%axis([4 20 0.9 1.15]);
subplot(1,3,2);plot(tI,-A4(aI).*tI.^(4/3),'--',tI,a4real.*tI.^(4/3),'-')
%legend('CY','Spectral','1st','2nd','location','SouthEast');
xlabel \tau
ylabel '-a_4'
legend('CY','2nd','location','SouthEast')
%title(['Error = ' num2str(norm((areaah(:,4)-spline(t(1:end-2),A4(1:end-2),areaah(:,1)))./areaah(:,4),inf))])
%axis([4 20 0.9 1.20]);
%
subplot(1,3,3);plot(tI,1./Uh(aI),'--',tI,rhreal,'-')
%legend('CY','Spectral','1st','2nd','location','SouthEast');
xlabel \tau
ylabel 'r_h'
legend('CY','location','SouthEast')
%title(['Error = ' num2str(norm((areaah(:,2)-spline(t(1:end-2),1./Uh(1:end-2),areaah(:,1)))./areaah(:,2),inf))])
%axis([4 20 1 1.25]);
