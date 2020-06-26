spath='wot/';
wot=[0.2 0.98848;0.3 1.0539;0.4 1.1249;0.5 1.1992;0.6 1.2764;0.7 1.3567;0.8 1.4413];
ttab=0:0.05:0.85;
%
wtab=polyval(polyfit(wot(:,1),wot(:,2),2),ttab);%spline(wot(:,1),wot(:,2),ttab);
%plot(ttab,wtab,'-','LineWidth',2,'color','r'),hold on
Ahtautab=zeros(length(ttab),2);Ahtautab(:,1)=ttab;Ahtautab(:,2)=wtab;save([spath 'n2.dat'],'Ahtautab','-ASCII');
%
wtab=polyval(polyfit(wot(:,1),wot(:,2),3),ttab);%spline(wot(:,1),wot(:,2),ttab);
%plot(ttab,wtab,'-.','LineWidth',2,'color','g'),hold on
Ahtautab=zeros(length(ttab),2);Ahtautab(:,1)=ttab;Ahtautab(:,2)=wtab;save([spath 'n3.dat'],'Ahtautab','-ASCII');
%
wtab=polyval(polyfit(wot(:,1),wot(:,2),4),ttab);%spline(wot(:,1),wot(:,2),ttab);
%plot(ttab,wtab,'--','LineWidth',2,'color','b'),hold on
Ahtautab=zeros(length(ttab),2);Ahtautab(:,1)=ttab;Ahtautab(:,2)=wtab;save([spath 'n4.dat'],'Ahtautab','-ASCII');
%
wtab=polyval(polyfit(wot(:,1),wot(:,2),5),ttab);%spline(wot(:,1),wot(:,2),ttab);
%plot(ttab,wtab,'.-','color','c','LineWidth',2),hold on
Ahtautab=zeros(length(ttab),2);Ahtautab(:,1)=ttab;Ahtautab(:,2)=wtab;save([spath 'n5.dat'],'Ahtautab','-ASCII');
%
wtab=polyval(polyfit(wot(:,1),wot(:,2),6),ttab);%spline(wot(:,1),wot(:,2),ttab);
%plot(ttab,wtab,':','color','m','LineWidth',2),hold on
Ahtautab=zeros(length(ttab),2);Ahtautab(:,1)=ttab;Ahtautab(:,2)=wtab;save([spath 'n6.dat'],'Ahtautab','-ASCII');
%
%
%plot(wot(:,1),wot(:,2),'o', 'MarkerSize',10,'color','black')
save([spath 'wot.dat'],'wot','-ASCII');
