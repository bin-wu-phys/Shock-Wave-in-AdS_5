clear;
fn={'ansatz100to1599L20Lmin40N128mu10000c3200H20' ; 'ansatz100to1599L20Lmin40N128mu10000c3200H30' ; 'ansatz100to1599L20Lmin40N128mu10000c3200H40'};
lt={'^','V','-'};lc={'r','g','b'};
ntau=1501;
pr={[1:2:30 31:10:100 101:50:ntau];[1:2:30 31:10:100 101:50:ntau];1:ntau};
nfn=length(fn);
larray=cell(size(fn));
Aharray=cell(size(fn));
a4array=cell(size(fn));
%
clf;
%
for m=1:nfn
    load(fn{m});larray{m}=['L = ' num2str(L) ', H = ' num2str(H) ', N = ' num2str(N)];
    Aharray{m}=areaah(:,3);a4array{m}=areaah(:,4);
    rgbc=lc{m};%[1 - (m-1)/(nfn-1) 0 (m-1)/(nfn-1)];
    subplot(1,2,1);plot(areaah(pr{m},1),areaah(pr{m},3),lt{m},'color', rgbc,'LineWidth',0.5),hold on
    subplot(1,2,2);plot(areaah(pr{m},1),-areaah(pr{m},4).*areaah(pr{m},1).^(4/3),lt{m},'color',rgbc,'LineWidth',0.5),hold on               
end
%
subplot(1,2,1);
xlabel \tau, ylabel 'A_h',
axis([0 17 2.6 3.4]),
legend(larray,'location','SouthEast')
subplot(1,2,2);
xlabel \tau, ylabel '-a_4 \tau^{4/3}',
axis([0 17 1 5]),
legend(larray,'location','SouthEast')
%
relerr=cell(nfn*(nfn-1)/2,4);l=1;
for n=1:nfn
    for m=n+1:nfn
       relerr{l,1} = fn{n};relerr{l,2} = fn{m};
       relerr{l,3}=norm(1 - Aharray{n}./Aharray{m},inf); 
       relerr{l,4}=norm(1 - a4array{n}./a4array{m},inf);l=l+1;
   end
end
%
save('HErr.mat','relerr');