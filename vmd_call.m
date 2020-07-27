function [omega,u] = vmd_call(x)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
alpha = 150;        % moderate bandwidth constraint
tau = 0;            % noise-tolerance (no strict fidelity enforcement)
K = 5;              % 5 modes
DC = 0;             % no DC part imposed
init = 0;           % initialize omegas uniformly
tol = 1e-7;
Fs=360;

[u, u_hat, omega] = VMD(x, alpha, tau, K, DC, init, tol);

% modes & corresponding center frequencies
 u1=u(1,:); 
 u2=u(2,:);
 u3=u(3,:);
 omega1=omega(:,1); 
 omega2=omega(:,2);
 omega3=omega(:,3);
 omega4=omega(:,4);
 omega5=omega(:,5);

 cf1=omega1(end)*Fs;
 cf2=omega2(end)*Fs;
 cf3=omega3(end)*Fs;
 cf4=omega4(end)*Fs;
 cf5=omega5(end)*Fs;
 %cf6=omega6(end)*Fs;
 
 figure;
for i=1:K
   subplot(K,1,i);
   plot (u(i,:),'LineWidth',1);xlabel('Samples');ylabel('Amplitude');axis('tight')
   cap = sprintf('%d mode', i);
   title(cap);
end
 
 figure;
 plot(x);ylabel('Amplitude');title('ECG Signal')
% linkaxes([m1,m2,m3,m4],'x');

omega = omega;
u=u;
end

