COLOR = 'r';
Fs = 10000;
Ts = 1/Fs;
%[z,p,k] = cheby2(3,60,300/500, 'low');  
[z,p,k] = cheby2(3,60,[0.08 0.12], 'bandpass');
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
