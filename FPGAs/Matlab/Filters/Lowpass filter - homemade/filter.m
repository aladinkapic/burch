% G(s)
s = tf('s');
H = 1 / (1 + 0.00318*s);

H = H * (1 / (1 + 0.00318*s));     %% increase order of filter
bode(H);

% get G(z) via tustin
Ts = 0.0001;                       %% Sample period
Gz = c2d(H,Ts,'tustin');