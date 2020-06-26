 clf;
%
fn = {'ansatz/tau20cbar16.mat';'ansatz/tau30cbar16.mat';'ansatz/tau40cbar16.mat';'ansatz/tau50cbar16.mat';'ansatz/tau60cbar16.mat';'ansatz/tau70cbar16.mat';'ansatz/tau80cbar16.mat'};%'ansatz/tau20cbar32.mat';'ansatz/tau30cbar32.mat';'ansatz/tau50cbar32.mat';'ansatz/tau100cbar32.mat';
%fn = {'1st/tau27cbar64.mat';'1st/tau43cbar64.mat'};
%fn={'1st/tau20cbar50.mat';'1st/tau27cbar50.mat'};
%fn = {'1st/tau43cbar80.mat';'1st/tau100cbar80.mat'};
wtau=zeros(length(fn),3);
taufi=1:.1:30;legendarray=cell(length(fn)+1,1);
[a4real Ahreal2nd]=latetimefit(1,taufi);
%
subplot(1,2,1);plot(taufi,Ahreal2nd,'-','color','b'),hold on
xlabel '\tau w^{3/2}', ylabel 'A_h w^{-3}',
axis([0 6 0.6 0.9])
subplot(1,2,2);plot(taufi,a4real.*taufi.^(4/3),'-','color','b'),hold on
xlabel '\tau w^{3/2}', ylabel '-a_4 \tau^{4/3} w^{-4}',
axis([0 6 0 0.9])
legendarray{1}='Hydro';
%cbar16tab=load('cbar50.dat');tau0=0:.01:1;a40=4*tau0.^2/3;
for m=1:length(fn)
    load(fn{m});
    tauI=2:length(areaah(:,1));%omega=mu; 
    taumI=areaah(:,1)>15;
    w = findw(areaah(taumI,1),areaah(taumI,4))
    ru = w^(3/2);lc=[m/length(fn) 1-m/length(fn) 0.5];
%    ru0=(w/omega^(2/9))^(3/2);
%    subplot(1,2,1);plot(cbar16tab(:,1)*ru0,cbar16tab(:,2)/ru0^2,'-','color','c','LineWidth',1),hold on
    subplot(1,2,1);plot(areaah(tauI,1)*ru,areaah(tauI,3)/ru^(2),'--','color',lc,'LineWidth',2 ),hold on
%    subplot(1,2,2);plot(tau0*ru0,a40.*tau0.^(4/3)/ru0^(8/3),'-','color','c','LineWidth',1),hold on
    subplot(1,2,2);plot(areaah(tauI,1)*ru,-areaah(tauI,4).*areaah(tauI,1).^(4/3)/w^(4),'--','color',lc,'LineWidth',2),hold on
%     ru=omega^(1/3);w=w/ru^(2/3);
%     [a4real Ahreal2nd]=latetimefit(w,taufi*ru);
%     subplot(2,2,3);plot(taufi*ru,Ahreal2nd,':',areaah(tauI,1)*ru,areaah(tauI,3)/ru^(2),'--','color',lc ),hold on
%     subplot(2,2,4);plot(taufi*ru,a4real.*(taufi.*ru).^(4/3),':',areaah(tauI,1)*ru,-areaah(tauI,4).*areaah(tauI,1).^(4/3)/ru^(8/3),'--','color',lc),hold on    
    legendarray{m+1}=['\tau_0 = ' num2str(areaah(1,1)*omega^(1/3)) ', w = ' num2str(w/omega^(2/9))];
end
%
subplot(1,2,1);
legend(legendarray,'location','SouthEast')
title( 'Entropy Density')
%
subplot(1,2,2);
legend(legendarray,'location','SouthEast')
title( 'Energy Density')
% %
% subplot(2,2,3);
% legend(legendarray{2:end},'location','SouthEast')
% title( 'Entropy Density')
% %
% subplot(2,2,4);
% legend(legendarray{2:end},'location','SouthEast')
% title( 'Energy Density')
