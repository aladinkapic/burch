fs   = 10e3;              % Very high sampling rate 10 kHz
f    = 50;                % Frequency of sinusoid
nCyl = 100;               % generate 100 cycles of sinusoid
t    = 0:1/fs:nCyl*1/f;   % time index
x    = sin(2*pi*f*t);     % sine vector

% sine of 500 Hz %

f1   = 1000;
x1   = sin(2*pi*f1*t);

y    = x + x1; %% Here we combine two sine inputs into one


x_2 = 0; x_1 = 0; x_0 = 0; % initial conditions
y_2 = 0; y_1 = 0; y_0 = 0; % initial conditions


y1  = zeros(1,length(y)); % new array with filtered values


for k=1:length(y)
    y(k) = y(k) * 1000;
end

% for k=1:length(y)
%    y(k) = int16((y(k) * 4095)/3.328); 
% end

for k=1:length(y)
    x_2 = x_1;
    x_1 = x_0;
    x_0 = 422;
    
    
    y_2 = y_1;
    y_1 = y_0;
    
%     y_0 = y_1 * 1.938 - y_2 * 0.939 + x_0 * 0.001 + x_1 * 0.002 + x_2 * 0.001;
    
%     y_0 = y_1 * 1938 - y_2 * 939 + x_0 * 1 + x_1 * 2 + x_2 * 1;

    y_0 = x_0 * 1 + x_1 * 2 + x_2 * 1;
    %y_0 = int64(y_0 / 1000);
    y1(k) = y_0;
end 

plot(t,y)
title('Continuous sinusoidal signal');
xlabel('Time(s)');
ylabel('Amplitude');
hold on
stem(t,y1)
title('Discrete sinusoidal signal');
xlabel('Time(Ts)');
ylabel('Amplitude');