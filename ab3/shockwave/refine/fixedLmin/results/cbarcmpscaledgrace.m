spath='cbar16/';
fn = {'ansatz/tau20cbar16.mat';'ansatz/tau30cbar16.mat';'ansatz/tau40cbar16.mat';'ansatz/tau50cbar16.mat';'ansatz/tau60cbar16.mat';'ansatz/tau70cbar16.mat';'ansatz/tau80cbar16.mat'};%'ansatz/tau20cbar32.mat';'ansatz/tau30cbar32.mat';'ansatz/tau50cbar32.mat';'ansatz/tau100cbar32.mat';
wtau=zeros(length(fn),3);
taufi=1:.1:30;legendarray=cell(length(fn)+1,1);
[a4real Ahreal2nd]=latetimefit(1,taufi);
%
%subplot(1,2,1);plot(taufi,Ahreal2nd,'-','color','b'),hold on
Ahtautab=zeros(length(taufi),2);Ahtautab(:,1)=taufi;Ahtautab(:,2)=Ahreal2nd;save([spath 'Ahhydro.dat'],'Ahtautab','-ASCII');
%
%subplot(1,2,2);plot(taufi,a4real.*taufi.^(4/3),'-','color','b'),hold on
Ahtautab=zeros(length(taufi),2);Ahtautab(:,1)=taufi;Ahtautab(:,2)=a4real.*taufi.^(4/3);save([spath 'a4hydro.dat'],'Ahtautab','-ASCII');
%
for m=1:length(fn)
    load(fn{m});
    tauI=2:length(areaah(:,1));%omega=mu; 
    taumI=areaah(:,1)>15;
    w = findw(areaah(taumI,1),areaah(taumI,4))
    ru = w^(3/2);
    %
    %subplot(1,2,1);plot(areaah(tauI,1)*ru,areaah(tauI,3)/ru^(2),'--','color',lc,'LineWidth',2 ),hold on
    Ahtautab=zeros(length(areaah(tauI,1)),2);Ahtautab(:,1)=areaah(tauI,1)*ru;Ahtautab(:,2)=areaah(tauI,3)/ru^(2);save([spath 'Ahtau' num2str(areaah(1,1)*omega^(1/3)) '.dat'],'Ahtautab','-ASCII');
    %
    %subplot(1,2,2);plot(areaah(tauI,1)*ru,-areaah(tauI,4).*areaah(tauI,1).^(4/3)/w^(4),'--','color',lc,'LineWidth',2),hold on
    Ahtautab=zeros(length(areaah(tauI,1)),2);Ahtautab(:,1)=areaah(tauI,1)*ru;Ahtautab(:,2)=-areaah(tauI,4).*areaah(tauI,1).^(4/3)/w^(4);save([spath 'a4tau' num2str(areaah(1,1)*omega^(1/3)) '.dat'],'Ahtautab','-ASCII');
end
%
