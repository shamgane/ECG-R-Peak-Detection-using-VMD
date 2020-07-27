 clear all;
 close all;

addpath('mcode','chebfun-master','mitdb');

%  [ann, anntype, subtype, chan, num, comments] = rdann('100','atr');
%  [signal, fs, tm] = rdsamp('100');
% ann = ann(1:68,1);
% tm = tm(1:20000,1);
% [omega,u]=vmd_call(signal(1:20000,1));
% ann20k = ann(1:68,:);
% %normalising and squaring - isolating the peak regions
% th=0.4;
% ecgsig = u(2,:);%signal(1:10000,1);
% maxVal=max(ecgsig);
% norm_ecg=ecgsig./maxVal;
% sqsig=norm_ecg.^2;
% [val,pos]=findpeaks(sqsig,tm,'MinPeakHeight',0.4);
% val = val';
%  %NonZeroVal=val>th;
%  %RPeak=NonZeroVal.*pos;
%  %Rval=NonZeroVal.*val;
% figure
% %plot(ann,sqsig(ann),'k*') %annotated
% %hold on;
% plot(pos,val,'ro');
% hold on;
% plot(tm,sqsig)
% plot(tm(ann20k),sqsig(ann),'k*') %annotated

% tm20 = tm(ann20k);
% sqsig20 = sqsig(ann20k);
% errpos = tm20 - pos;



%%%%%%%%%%%%%%%%%%%%
%plotting the orig signal
% figure
% plot(tm,ecgsig)
% hold on
% plot(tm(ann),ecgsig(ann),'ro')
% xlabel('Seconds')
% ylabel('Amplitude')
% title('Subject - MIT-BIH 200')

%%%%%%%%%%%%%%%%%%%%%
%R peak finding using wavelet transform
% wt = modwt(ecgsig,5); %take the original signal instead f ecgsig
% wtrec = zeros(size(wt));
% wtrec(4:5,:) = wt(4:5,:);
% y = imodwt(wtrec,'sym4');
% 
% y = abs(y).^2;
% [qrspeaks,locs] = findpeaks(y,tm,'MinPeakHeight',0.1,...
%     'MinPeakDistance',0.150);
% figure
% plot(tm,y)
% hold on
% plot(locs,qrspeaks,'ro') %computed
% xlabel('Seconds')
% title('R Peaks Localized by Wavelet Transform with Automatic Annotations')
% 
% plot(tm(ann),y(ann),'k*') %annotated
% title('R peaks Localized by Wavelet Transform with Expert Annotations')
% %%%%%%%%%%%%%%%%%%

%R peak using threshold findpeaks
% th=0.15;
% Z=u(2,:);
% [val,pos]=findpeaks(Z);
% NonZeroVal=val>th;
%  RPeak=NonZeroVal.*pos;
%  Rval=NonZeroVal.*val;
% figure
% 
% rpFin=RPeak(find(RPeak))';
% 
% plot(ann,ecgsig(ann),'k*') %annotated
% hold on;
% plot(RPeak,Rval,'ro');
% plot(ecgsig)

%chebyshev

ch=cheb_call(signal);

ceg=chebfun(signal(1:20000,1),[1,20000],'equi');
[ignored,extrema] = minandmax(ceg,'local');
%hold on, plot(extrema,ceg(extrema),'.r')
%h2 = diff(ceg,2);
maxima = extrema(ceg(extrema)>0.4); %0.4 is threshold
figure;
plot(maxima,ceg(maxima),'ok')
hold on
plot(ceg)
%hold on
plot(ann,signal(ann),'k*') %annotated


