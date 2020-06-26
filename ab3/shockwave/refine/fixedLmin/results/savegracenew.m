 clf;
%
fn = {'ansatz/tau20cbar64.mat';'ansatz/tau20cbar128.mat';'ansatz/tau20cbar512.mat'};
fsn = {'taup2cbar64.dat';'taup2cbar128.dat';'taup2cbar512.dat'};
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

