 clf;
%
fn = {'1st/tau20cbar50.mat';'1st/tau20cbar60.mat';'1st/tau20cbar100.mat';'ansatz/tau20cbar16.mat';'ansatz/tau20cbar32.mat';'ansatz/tau20cbar64.mat';'ansatz/tau20cbar128.mat';'ansatz/tau20cbar512.mat'};
fsn = {'taup2cbar05.dat';'taup2cbar06.dat';'taup2cbar10.dat';'taup2cbar16.dat';'taup2cbar32.dat';'taup2cbar64.dat';'taup2cbar128.dat';'taup2cbar512.dat'};
%
w=zeros(size(fn));
legendarray=cell(size(fn));
ru=0.5;
taufi=2:.1:17;
for m=1:length(fn)
    load(fn{m});
    taumI=areaah(:,1)>12;
    w(m)=findw(areaah(taumI,1),areaah(taumI,4))
%
    [pL pT] = pressure(areaah(:,1)*ru,areaah(:,4)/ru^4);
%    subplot(1,3,3);plot(areaah(:,1)*ru,pT,'-.','color','r','LineWidth',2),hold on
%    subplot(1,3,3);plot(areaah(:,1)*ru,pL,'--','color','g','LineWidth',2),hold on
    pTtautab=zeros(length(areaah(:,1)),2);pTtautab(:,1)=areaah(:,1)*ru;pTtautab(:,2)=pT;save(['pT' fsn{m}],'pTtautab','-ASCII');
    pLtautab=zeros(length(areaah(:,1)),2);pLtautab(:,1)=areaah(:,1)*ru;pLtautab(:,2)=pL;save(['pL' fsn{m}],'pLtautab','-ASCII');
    pLopT=pTtautab;pLopT(:,2)=pLtautab(:,2)./pTtautab(:,2);save(['pLopT' fsn{m}],'pLopT','-ASCII');
end
%
for m=1:length(fn)
    [pL pT] = pressurehydro(w(m),taufi);%pressure(areaah(:,1)*ru,areaah(:,4)/ru^4);
%    subplot(1,3,3);plot(taufi*ru,pT/ru^4,'-','color','b','LineWidth',1),hold on
%    subplot(1,3,3);plot(taufi*ru,pL/ru^4,'-','color','b','LineWidth',1),hold on
    pTtautab=zeros(length(taufi),2);pTtautab(:,1)=taufi*ru;pTtautab(:,2)=pT/ru^4;save(['pThydro' fsn{m}],'pTtautab','-ASCII');
    pLtautab=zeros(length(taufi),2);pLtautab(:,1)=taufi*ru;pLtautab(:,2)=pL/ru^4;save(['pLhydro' fsn{m}],'pLtautab','-ASCII');
    pLopT=pTtautab;pLopT(:,2)=pLtautab(:,2)./pTtautab(:,2);save(['pLopThydro' fsn{m}],'pLopT','-ASCII');
end
