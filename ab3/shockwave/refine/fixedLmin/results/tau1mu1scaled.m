 clf;
%
fn = {'1st/tau100cbar25.mat';'ansatz/tau100cbar32.mat';'1st/tau100cbar45.mat';'ansatz/tau100cbar64.mat';'ansatz/tau100cbar128.mat'};
taufi=.5:.1:30;legendarray=cell(length(fn)+1,1);
[a4real Ahreal2nd]=latetimefit(1,taufi);
%
subplot(1,2,1);plot(taufi,Ahreal2nd,'-','color','r'),hold on
xlabel \tau, ylabel 'A_h',
axis([0 10 0.6 1])
subplot(1,2,2);plot(taufi,a4real.*taufi.^(4/3),'-','color','r'),hold on
xlabel \tau, ylabel '-a_4 \tau^{4/3}',
axis([0 10 0 1])
legendarray{1}='Hydro';
for m=1:length(fn)
    load(fn{m});
    legendarray{m+1}=['c = ' num2str(cbar)];
    tauI=2:length(areaah(:,1));  
    taumI=areaah(:,1)>15;
    w = findw(areaah(taumI,1),areaah(taumI,4))
    ru = w^(3/2);lc=[m/length(fn) 1-m/length(fn) 0.5];
    (tautherm( fname, 0.05 ))*ru
    subplot(1,2,1);plot(areaah(tauI,1)*ru,areaah(tauI,3)/ru^(2),'--','color',lc ),hold on
    subplot(1,2,2);plot(areaah(tauI,1)*ru,-areaah(tauI,4).*areaah(tauI,1).^(4/3)/w^(4),'--','color',lc),hold on               
end
%
subplot(1,2,1);
legend(legendarray,'location','SouthEast')
title( 'Entropy Density')
%
subplot(1,2,2);
legend(legendarray,'location','SouthEast')
title( 'Energy Density')