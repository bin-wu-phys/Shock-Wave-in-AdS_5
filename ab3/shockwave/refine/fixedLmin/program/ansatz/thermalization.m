%Solve Equ.s (15) in CY's paper
%Here we redefine S = Sigam^3
tic
%r-grids
L = 60; N =256; Lmin = 0.1;
[dr cp] = cheb(N); 
%r = 0.5*(L-Lmin)*(cp+1)+Lmin; r(r==0) = 5e-4; dr = 2*dr/(L-Lmin);
H = 3;a = (H^2 - H*L - H*Lmin + L*Lmin)/(2*H - L - Lmin);b=log((-H + L)/(H - Lmin));c=-((H^2 - L*Lmin)/(-2*H + L + Lmin));
r = a*exp(b*cp) + c;dr = diag(exp(-b*cp)/(a*b))*dr;
 dri = inv(dr(2:N+1,2:N+1));areaah = [];


%initial conditions
omega = 0.4^3;%adjust the position of the naive horizon, r_nh = omega/tau^(1/3)
cbar = 64;
tmax = 16;dtau = 1/N^2; 
tau = .25;
deltat = 0.01; nt = floor(deltat/dtau); dtau = deltat/nt;k = 0;

%tau = taui - 2*dtau
tau = tau - 2*dtau;

%boundary condition at tau
[b4 b4t1 b4t2 b4nm1 b4nm2] = initializeb4(tau,dtau,omega);
a4 = initializea4(tau,omega);

%metric at tau - 2*dtau
[B S] = initializemetric(tau,r,dr,omega,cbar);
[theta phi] = thetaphi(dr,dri, B, S, tau, a4,b4, b4t1, b4t2, r);
A = getA( dr,dri,B, S, theta, phi, tau, a4,b4,b4t1,b4t2, r );
dtauSnm1 = -0.5*A.*(dr*S) + 6*theta;dtauBnm1 = -0.5*A.*(dr*B) - S.^(-0.5).*phi;

%tau = taui - dtau
tau = tau + dtau;

%boundary condition of theta at tau - dta
[b4 b4t1 b4t2 b4nm1 b4nm2] = initializeb4(tau,dtau,omega);
a4 = initializea4(tau,omega);

%metric at tau - dtau
[B S] = initializemetric(tau,r,dr,omega,cbar);
[theta phi] = thetaphi(dr,dri, B, S, tau, a4, b4, b4t1, b4t2, r);
A = getA( dr,dri,B, S, theta, phi, tau, a4,b4,b4t1,b4t2, r );
dtauS = -0.5*A.*(dr*S) + 6*theta;dtauB = -0.5*A.*(dr*B) - S.^(-0.5).*phi;

%tau = taui
tau = tau + dtau;

%boundary condition of theta at tau
[b4 b4t1 b4t2 b4nm1 b4nm2] = initializeb4(tau,dtau,omega);
a4 = initializea4(tau,omega);

%metric at initial time 
[B S] = initializemetric(tau,r,dr,omega,cbar);
[theta phi] = thetaphi(dr,dri, B, S, tau, a4, b4, b4t1, b4t2, r);
A = getA( dr,dri,B, S, theta, phi, tau, a4,b4,b4t1,b4t2, r );

%Find horizon
 Sigma=S.^(1/3);
 err = norm(dr^2*Sigma+0.5*(dr*B).^2.*Sigma,inf);
 [rh area] = findhorizon(r,theta,S);
 areaah = [areaah; [tau rh area a4 err]];
clf;

while( tau <= tmax)
    %S and B at tau + dtau
    dtauSnm2 = dtauSnm1; dtauSnm1 = dtauS;
    dtauBnm2 = dtauBnm1; dtauBnm1 = dtauB;    
    dtauS = -0.5*A.*drS(dr,r,S) + 6*theta;dtauB = -0.5*A.*(dr*B) - S.^(-0.5).*phi;
    S = S + dtau*(23*dtauS/12 - 16*dtauSnm1/12 + 5*dtauSnm2/12 );
    B = B + dtau*( 23*dtauB/12- 16*dtauBnm1/12 + 5*dtauBnm2/12 ); 
    
    %a4 theta phi at tau + dtau
    a4 = finda4(a4,b4,tau,dtau ); tau = tau + dtau;
    
    %Find b4 at tau + dtau
    b4nm2 = b4nm1; b4nm1 = b4;
    [b4 b4t1 b4t2] = findb4(b4nm1,b4nm2,a4,tau,dtau,B(1),r(1));
    
    %
    %theta phi at tau + dtau
    [theta phi] = thetaphi(dr,dri, B, S, tau, a4,b4, b4t1, b4t2, r);    
    A = getA( dr,dri,B, S, theta, phi, tau, a4,b4,b4t1,b4t2, r );
%    [r S]
      
    k=k+1;
    if(k==nt)
        %Find horizon
        [rh area] = findhorizon(r,theta,S);
        Sigma=S.^(1/3);
        err = norm(dr^2*Sigma+0.5*(dr*B).^2.*Sigma,inf);
        areaah = [areaah; [tau rh area a4 err]];


        %plot results
%         Sreal = r.^3.*tau + r.^2; Areal = r.^2 + a4./r.^2; 
%         Breal = - 2*log(tau + 1./r)/3; lambda = ( log(2) - 1)/(6*omega^2);
%         rhreal = omega./areaah(:,1).^(1/3);% - 0.5./areaah(:,1);
%         Ahreal = omega^3;% - 0.5*omega^2*areaah(:,1).^(-2/3) + omega*(4 + pi + 12*omega^2*lambda + 4*log(2) )*areaah(:,1).^(-4/3)/24;
%         a4real=-omega^4./areaah(:,1).^(4/3);
%         %
%         subplot(2,3,1);plot(r,Sreal,'-',r,S,'.'),title([' \tau = ', num2str(tau), ', error = ',num2str(norm(S-Sreal,inf))]),xlabel r, ylabel 'S';
%         subplot(2,3,2);plot(r,Breal,'--',r,B,'*'),title([' \tau = ', num2str(tau), ', error = ',num2str(norm(B-Breal,inf))]),xlabel r, ylabel 'B';
%         subplot(2,3,3);plot(1./r,Areal./r,'--',1./r,A./r,'*'),title([' \tau = ', num2str(tau), ', error = ',num2str(norm(A - Areal,inf))]),xlabel '1/r', ylabel 'A'; 
%         subplot(2,3,4);plot(areaah(:,1),areaah(:,2),'.',areaah(:,1),rhreal,'-' ),title(['error = ',num2str(norm(areaah(:,2)-rhreal,inf))]),xlabel \tau, ylabel 'r_h';
%         subplot(2,3,5);plot(areaah(:,1),areaah(:,3),'.',areaah(:,1),Ahreal ,'-' ),title(['error = ',num2str(norm(areaah(:,3)-Ahreal,inf))]),xlabel \tau, ylabel 'A_h';
%         subplot(2,3,6);plot(areaah(:,1),areaah(:,4),'.',areaah(:,1),a4real,'-' ),title(['error = ',num2str(norm(areaah(:,4)-a4real,inf))]),xlabel \tau, ylabel 'a4';
         disp(areaah(end,:));
%         pause(0.01);
        k = 0;
    end
end
tElapse = toc
%save(['latetimedatatau' num2str(floor(100*areaah(1,1))) 'to' num2str(floor(areaah(end,1))) 'L' num2str(L) 'Lmin' num2str(floor(100*Lmin)) 'N' num2str(N) num2str(N) 'mu' num2str(floor(100*omega)) 'c' num2str(floor(100*cbar)) 'H' num2str(10*H)  ])
