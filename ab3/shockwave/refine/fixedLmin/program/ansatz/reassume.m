%Solve Equ.s (15) in CY's paper
%Here we redefine S = Sigam^3
% tic
% tmax =tmax*2^(1/3);
% while( tau < tmax)
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
      
 %   k=k+1;
 %   if(k==nt)
        %Find horizon
        [rh area] = findhorizon(r,theta,S);
        Sigma=S.^(1/3);
        err = norm(dr^2*Sigma+0.5*(dr*B).^2.*Sigma,inf);
        areaah = [areaah; [tau rh area a4 err]];


        %plot results
        %
        subplot(2,3,1);loglog(r,S,'.'),xlabel r, ylabel 'S';
        subplot(2,3,2);loglog(r,B,'*'),xlabel r, ylabel 'B';
        subplot(2,3,3);loglog(r,A,'*'),xlabel 'r', ylabel 'A'; 
        subplot(2,3,4);plot(areaah(:,1),areaah(:,2),'.'),xlabel \tau, ylabel 'r_h';
        subplot(2,3,5);plot(areaah(:,1),areaah(:,3),'.'),xlabel \tau, ylabel 'A_h';
        subplot(2,3,6);plot(areaah(:,1),areaah(:,4),'.'),xlabel \tau, ylabel 'a4';
         disp(areaah(end,:));
%        pause(0.01);
%        k = 0;
%    end

% end
% save(['latetimedatatau01to' num2str(tau) 'L' num2str(L) 'Lmin' num2str(floor(100*Lmin)) 'N' num2str(N) 'H' num2str(10*H) 'mu005'])
% tElapse = toc