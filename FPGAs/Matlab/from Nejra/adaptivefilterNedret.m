% Example without sin/cos for Ts = 1;
% transfer function in discrete time
% Gzt = tf(Numerator,Denominator,Ts);
% Gzt = tf([1 0],[1 2 10], Ts);

% our case with sym variables and open loop case
clear all
COLOR = 'k';

% w0 - frequency to be filtered
Ts=0.5e-04;
a0 = 1; 
a1 = 1;
a2 = 1;
n = 20;

fmin = 100;
fmax = 1000;
wmin=2*pi*fmin;
wmax=2*pi*fmax;

z = tf('z',Ts);
Gz =[a2]/[a0 - a1 * z^(-n)]; % ???
%Gz =[1 + z^(-1)]/[1 - a1 * z^(-1)]; % high-pass RC
%Gz =[a0 + z^(-1)]/[a1 - a2 * z^(-1)];  % high-pass
%Gz = [a0 * z^2 + a1 * z^1 + 1]/[a2 * z^2];  % band-pass 1 0.8 2
%[mag,phase,wout] = bode(Gz,{wmin,wmax});
[mag,phase,wout] = bode(Gz);

subplot(2,1,1);
semilogx(wout(:,1)/(2*pi), 20*log10(squeeze(mag)), COLOR); zoom on; grid on; 
title('magnitude'); xlabel('Frequency (Hz)'); ylabel('Magnitude (dB)'); hold on;
subplot(2,1,2);
semilogx(wout(:,1)/(2*pi), squeeze(phase), COLOR); zoom on; grid on; 
title('Phase'); xlabel('Frequency (Hz)'); ylabel('Phase (deg)'); hold on


% % input sin function without DC component
% t = 0:Ts:5; a0 = 0.5; a1 = 1; a2 = 1; a3 = 1;
% s_input = a0 + a1 * sin(w/2*t) + a2 * sin (w*t) + a3 * sin (w*2*t); 
% figure; plot(t, s_input)

