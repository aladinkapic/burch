% Example without sin/cos for Ts = 1;
% transfer function in discrete time
% Gzt = tf(Numerator,Denominator,Ts);
% Gzt = tf([1 0],[1 2 10], Ts);

% our case with sym variables and open loop case
clear all
COLOR = 'r';
syms C mi w0 Omega

% w0 - frequency to be filtered
% w = 2*pi*w0;
w0 = 50;
w = 2*pi*w0;
Ts=0.5e-04;
Omega = 2*pi/Ts;
mi=0.01;
C=0.1;

fmin = 40;
fmax = 70;
wmin=2*pi*fmin;
wmax=2*pi*fmax;

z = tf('z',Ts);

% radian sampling frequency
% Gz = [(2*mi*C^2)*(z*cos(2*pi*w*Omega^(-1))-1)]/[(z^2-2*z*cos(2*pi*w*Omega^(-1))+1)];
Gz =[(2*mi*C^2)*(z*cos(w*Ts)-1)]/[(z^2-2*z*cos(w*Ts)+1)];
[mag,phase,wout] = bode(Gz,{wmin,wmax});

subplot(2,1,1);
semilogx(wout(:,1)/(2*pi), 20*log10(squeeze(mag)), COLOR); zoom on; grid on; 
title('magnitude'); xlabel('Frequency (Hz)'); ylabel('Magnitude (dB)'); hold on;
subplot(2,1,2);
semilogx(wout(:,1)/(2*pi), squeeze(phase), COLOR); zoom on; grid on; 
title('Phase'); xlabel('Frequecy (Hz)'); ylabel('Phase (deg)'); hold on


% % input sin function without DC component
% t = 0:Ts:5; a0 = 0.5; a1 = 1; a2 = 1; a3 = 1;
% s_input = a0 + a1 * sin(w/2*t) + a2 * sin (w*t) + a3 * sin (w*2*t); 
% figure; plot(t, s_input)

