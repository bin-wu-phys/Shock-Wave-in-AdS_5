system('ls tau20cbar16*.mat > fn.txt');
fn=importdata('fn.txt');
system('rm fn.txt');
larray=cell(size(fn));
%
clf;
%
for m=1:length(fn)
    load(fn{m});larray{m}=['L = ' num2str(L) ', d\tau = ' num2str(dtau*N^2) ', N = ' num2str(N)];
    rgbc=[(N-128)/128 .8*(L-10)/40 1];
    subplot(1,2,1);plot(areaah(:,1),areaah(:,3),'--','color', rgbc),hold on
    subplot(1,2,2);plot(areaah(:,1),-areaah(:,4).*areaah(:,1).^(4/3),'--','color',rgbc),hold on               
end
%
subplot(1,2,1);
xlabel \tau, ylabel 'A_h',
%axis([0 10 0.6 1]),
legend(larray,'location','SouthEast')
subplot(1,2,2);
xlabel \tau, ylabel '-a_4 \tau^{4/3}',
%axis([0 10 0 1]),
legend(larray,'location','SouthEast')
