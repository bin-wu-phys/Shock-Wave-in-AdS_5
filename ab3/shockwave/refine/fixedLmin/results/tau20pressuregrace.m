spath='pressure/';
%
fn = {'1st/tau20cbar50.mat'};
%
w=zeros(size(fn));
%legendarray=cell(size(fn));
ru=0.5;
taufi=2:.1:17;
for m=1:length(fn)
    load(fn{m});
    taumI=areaah(:,1)>12;
    w(m)=findw(areaah(taumI,1),areaah(taumI,4))
%    legendarray{m}=['$\overline{c}$ = ' num2str(cbar)];
%
    [pL pT] = pressure(areaah(:,1),areaah(:,4));
    %plot(areaah(:,1)*ru,-3*pT./areaah(:,4),'-.','color','r','LineWidth',2),hold on
    Ahtautab=zeros(length(areaah(:,1)),2);Ahtautab(:,1)=areaah(:,1)*ru;Ahtautab(:,2)=-3*pT./areaah(:,4);save([spath 'pT.dat'],'Ahtautab','-ASCII');
    %plot(areaah(:,1)*ru,-3*pL./areaah(:,4),'--','color','g','LineWidth',2),hold on
    Ahtautab=zeros(length(areaah(:,1)),2);Ahtautab(:,1)=areaah(:,1)*ru;Ahtautab(:,2)=-3*pL./areaah(:,4);save([spath 'pL.dat'],'Ahtautab','-ASCII');
end
%
tautab=0:0.2:18;
ideal=ones(size(tautab));
for m=1:length(fn)
    [pL pT] = pressurehydro(w(m),taufi);%pressure(areaah(:,1)*ru,areaah(:,4)/ru^4);
    [a4real Ahreal]=latetimefit(w(m),taufi);
    %plot(taufi*ru,3*pT./a4real,'-','color','b','LineWidth',1),hold on
    Ahtautab=zeros(length(taufi),2);Ahtautab(:,1)=taufi*ru;Ahtautab(:,2)=3*pT./a4real;save([spath 'pThydro.dat'],'Ahtautab','-ASCII');
    %plot(taufi*ru,3*pL./a4real,'-','color','b','LineWidth',1),hold on
    Ahtautab=zeros(length(taufi),2);Ahtautab(:,1)=taufi*ru;Ahtautab(:,2)=3*pL./a4real;save([spath 'pLhydro.dat'],'Ahtautab','-ASCII');
    %plot(tautab*ru,ideal,'-','color','b','LineWidth',1),hold on
    Ahtautab=zeros(length(tautab),2);Ahtautab(:,1)=tautab*ru;Ahtautab(:,2)=ideal;save([spath 'one.dat'],'Ahtautab','-ASCII');
end
