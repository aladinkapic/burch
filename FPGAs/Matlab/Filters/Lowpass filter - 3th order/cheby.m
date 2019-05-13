%% prigušenje je 60dB, sampliramo sa 300Hz, i ako uzmemo u obzir to da je Fs = 1000, onda dobijemo 0.6PI rad/sample
COLOR = 'r';
Fs = 10000;
Ts = 1/Fs;
%[z,p,k] = cheby2(8,60,100/500, 'low');  
% [z,p,k] = cheby2(10,60,300/500, 'low');  
[z,p,k] = cheby2(3,60,150/500, 'low'); 
%[z,p,k] = cheby2(3,60,[0.05 0.1], 'stop');
sos = zp2sos(z,p,k);   % zp2sos converts a discrete-time zero-pole-gain representation of a given digital filter to an equivalent second-order section representation z domain
fvtool(sos,1,'Fs',Fs)
[b,a] = sos2tf(sos); % - z-domain if sos in z - converts a second-order section representation of a given digital filter to an equivalent transfer function representation.

Gz = tf(b,a,Ts);

fmin = 40;     
fmax = 70;     
wmin=2*pi*fmin;
wmax=2*pi*fmax;
%[mag,phase,wout] = bode(Gz,{wmin,wmax});
[mag,phase,wout] = bode(Gz);

subplot(2,1,1);
set(gca,'xscale','linear')
plot(wout(:,1)/(2*pi), squeeze(mag), COLOR); zoom on; grid on; 
% semilogx(wout(:,1)/(2*pi), 20*log10(squeeze(mag)), COLOR); zoom on; grid on; 
title('magnitude');   xlabel('Frequency (Hz)'); ylabel('Magnitude (dB)'); hold on;
subplot(2,1,2);
% semilogx(wout(:,1)/(2*pi), squeeze(phase), COLOR); zoom on; grid on; 
plot(wout(:,1)/(2*pi), squeeze(phase), COLOR); zoom on; grid on; 
title('Phase'); xlabel('Frequency (Hz)'); ylabel('Phase (deg)'); hold on
