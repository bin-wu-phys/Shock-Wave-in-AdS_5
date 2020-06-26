%Solve Equ.s (15) in CY's paper
%Here we redefine S = Sigam^3
tic
tmax =tmax*2^(1/3);
while( tau < tmax)
    %S and B at tau + dtau
    dtauSnm2 = dtauSnm1; dtauSnm1 = dtauS;
    dtauBnm2 = dtauBnm1; dtauBnm1 = dtauB;    
    dtauS = -0.5*A.*(dr*S) + 6*theta;dtauB = -0.5*A.*(dr*B) - S.^(-0.5).*phi;
    S = S + dtau*(23*dtauS/12 - 16*dtauSnm1/12 + 5*dtauSnm2/12 );
    B = B + dtau*( 23*dtauB/12- 16*dtauBnm1/12 + 5*dtauBnm2/12 ); 
    
    %a4 theta phi at tau + dtau
    a4 = finda4(a4,b4,tau,dtau ); tau = tau + dtau;
    
    %Find b4 at tau + dtau
    b4nm2 = b4nm1; b4nm1 = b4;
    [b4 b4t1 b4t2] = findb4(b4nm1,b4nm2,a4,tau,dtau,B(1),r(1));
    
    %theta phi at tau + dtau
    [theta phi] = thetaphi(dr, B, S, tau, a4,b4, b4t1, b4t2, L, N);    

    %A at tau + dtau
    drdrA = -4 + 3*S.^(-0.5).*(dr*B).*phi + 8*(dr*S).*theta.*(S.^(-2));
    cdrA = 2*L - 2*a4/L^3 + ( -2 + 6*tau^4*( a4 +2*b4) )/(3*tau^5*L^4) + 4*( 8 + 3*tau^4*( -2*a4 - 4*b4 + 3*tau*b4t1 ) )/(15*tau^6*L^5) + ( -1256 + 6*tau^4*( 40*a4 + 80*b4 - 69*tau*b4t1 + 45*tau^2*b4t2 ))/(243*tau^7*L^6); 
    drA = [0; dr(2:N+1,2:N+1)\drdrA(2:N+1)] + cdrA;
    ca = L^2+a4/L^2 + ( 2 - 6*tau^4*(a4 + 2*b4))/(9*L^3*tau^5) + ( -8 + 3*tau^4*( 2*a4 + 4*b4 - 3*tau*b4t1 ) )/(15*tau^6*L^4) + ( 1256 - 6*tau^4*( 40*a4 + 80*b4 - 69*tau*b4t1 + 45*tau^2*b4t2 ) )/(1215*tau^7*L^5);    
    A = [0; dr(2:N+1,2:N+1)\drA(2:N+1)] + ca;
%    [r S]
      
    k=k+1;
    if(k==nt)
        %Find horizon
        [rh area] = findhorizon(r,theta,S);
        areaah = [areaah; [tau rh area a4]];
        
        %plot results
        Sreal = r.^3.*tau + r.^2; Areal = r.^2 + a4./r.^2; 
        Breal = - 2*log(tau + 1./r)/3; lambda = ( log(2) - 1)/(6*omega^2);
        rhreal = omega./areaah(:,1).^(1/3);% - 0.5./areaah(:,1);
        Ahreal = omega^3;% - 0.5*omega^2*areaah(:,1).^(-2/3) + omega*(4 + pi + 12*omega^2*lambda + 4*log(2) )*areaah(:,1).^(-4/3)/24;
        a4real=-omega^4./areaah(:,1).^(4/3);
        %
        subplot(2,3,1);plot(r,Sreal,'-',r,S,'.'),title([' \tau = ', num2str(tau), ', error = ',num2str(norm(S-Sreal,inf))]),xlabel r, ylabel 'S';
        subplot(2,3,2);plot(r,Breal,'--',r,B,'*'),title([' \tau = ', num2str(tau), ', error = ',num2str(norm(B-Breal,inf))]),xlabel r, ylabel 'B';
        subplot(2,3,3);plot(1./r,Areal./r,'--',1./r,A./r,'*'),title([' \tau = ', num2str(tau), ', error = ',num2str(norm(A - Areal,inf))]),xlabel '1/r', ylabel 'A'; 
        subplot(2,3,4);plot(areaah(:,1),areaah(:,2),'.',areaah(:,1),rhreal,'-' ),title(['error = ',num2str(norm(areaah(:,2)-rhreal,inf))]),xlabel \tau, ylabel 'r_h';
        subplot(2,3,5);plot(areaah(:,1),areaah(:,3),'.',areaah(:,1),Ahreal ,'-' ),title(['error = ',num2str(norm(areaah(:,3)-Ahreal,inf))]),xlabel \tau, ylabel 'A_h';
        subplot(2,3,6);plot(areaah(:,1),areaah(:,4),'.',areaah(:,1),a4real,'-' ),title(['error = ',num2str(norm(areaah(:,4)-a4real,inf))]),xlabel \tau, ylabel 'a4';
        disp(areaah(end,:));
        pause(0.01);
        k = 0;
    end
end
save(['latetimedatatau01to' num2str(tau) 'L' num2str(L) 'Lmin' num2str(floor(100*Lmin)) 'N' num2str(N) 'H' num2str(10*H) 'mu005'])
tElapse = toc