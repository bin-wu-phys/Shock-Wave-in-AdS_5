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
    w(m)=findw(areaah(taumI,1),areaah(taumI,4))/ru^(2/3)
%
    Ahtautab=zeros(length(areaah(:,1)),2);Ahtautab(:,1)=areaah(:,1)*ru;Ahtautab(:,2)=areaah(:,3)/ru^2;save(['Ah' fsn{m}],'Ahtautab','-ASCII');
    a4tautab=zeros(length(areaah(:,1)),2);a4tautab(:,1)=areaah(:,1)*ru;a4tautab(:,2)=-areaah(:,4)/ru^(12/3);save(['a4' fsn{m}],'a4tautab','-ASCII');
end
%
for m=1:length(fn)
    [a4real Ahreal2nd]=latetimefit(w(m),taufi);
%    subplot(1,3,1);plot(taufi*ru,Ahreal2nd/ru^2,'-','color','b'),text(7,Ahreal2nd(end)/ru^2+.03,['w = ' num2str(w(m)/ru^(2/3))]),hold on
%    subplot(1,3,2);plot(taufi*ru,a4real/ru^(12/3),'-','color','b')%,text(4,a4real(floor(end/2.2))/ru^4+.02,['w = ' num2str(w(m)/ru^(2/3))]),hold on
    Ahtautab=zeros(length(taufi),2);Ahtautab(:,1)=taufi*ru;Ahtautab(:,2)=Ahreal2nd/ru^2;save(['Ahhydro' fsn{m}],'Ahtautab','-ASCII');
    a4tautab=zeros(length(taufi),2);a4tautab(:,1)=taufi*ru;a4tautab(:,2)=a4real/ru^(12/3);save(['a4hydro' fsn{m}],'a4tautab','-ASCII');
end
%
fn = {'1st/tau20cbar50.mat'};
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

end
%
for m=1:length(fn)
    [pL pT] = pressurehydro(w(m),taufi);%pressure(areaah(:,1)*ru,areaah(:,4)/ru^4);
%    subplot(1,3,3);plot(taufi*ru,pT/ru^4,'-','color','b','LineWidth',1),hold on
%    subplot(1,3,3);plot(taufi*ru,pL/ru^4,'-','color','b','LineWidth',1),hold on
    pTtautab=zeros(length(taufi),2);pTtautab(:,1)=taufi*ru;pTtautab(:,2)=pT/ru^4;save(['pThydro' fsn{m}],'pTtautab','-ASCII');
    pLtautab=zeros(length(taufi),2);pLtautab(:,1)=taufi*ru;pLtautab(:,2)=pL/ru^4;save(['pLhydro' fsn{m}],'pLtautab','-ASCII');
end
