%load('1st/tau20cbar60.mat');taucbar='taup2cbar06.dat';
ru=0.5;Ahtautab=zeros(length(areaah(:,1)),2);Ahtautab(:,1)=areaah(:,1)*ru;Ahtautab(:,2)=areaah(:,3)/ru^2;save(['Ah' taucbar],'Ahtautab','-ASCII');
ru=0.5;a4tautab=zeros(length(areaah(:,1)),2);a4tautab(:,1)=areaah(:,1)*ru;a4tautab(:,2)=-areaah(:,4)/ru^(12/3);save(['a4' taucbar],'a4tautab','-ASCII');