N   = 26;         % FIR filter order
Fp  = 50;         % 20 kHz passband-edge frequency
Fs  = 128;        % 96 kHz sampling frequency
Rp  = 0.00057565; % Corresponds to 0.01 dB peak-to-peak ripple
Rst = 1e-4;       % Corresponds to 80 dB stopband attenuation

eqnum = firceqrip(N,Fp/(Fs/2),[Rp Rst],'passedge'); % eqnum = vec of coeffs
lowpassFIR = dsp.FIRFilter('Numerator',eqnum);
fvtool(eqnum,'Fs',Fs,'Color','White') % Visualize filter

lowpassFilt = dsp.LowpassFilter('DesignForMinimumOrder',false, 'FilterOrder',N,'PassbandFrequency',Fp,'SampleRate',Fs, 'PassbandRipple',0.01, 'StopbandAttenuation',80);

coef = tf(lowpassFilt);
%[num,den] = tfdata(coef) 
