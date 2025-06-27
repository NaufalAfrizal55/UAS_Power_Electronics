Vin =24;
Vout = 12;
D = Vout/Vin;
fsw = 10e3;
Rload = 2.4;
R_change = 10;

IL = Vout/Rload;
Iout_ripple = 0.2 * IL;
Vout_ripple = 0.02 * Vout;

L = (Vout * (1 - D)) / (Iout_ripple * fsw);    # 6e-4
C = (Vout * (1 - D)) / (8 * L * fsw^2 * Vout_ripple);    #52e-6


%% =====================
% OUTER LOOP (Voltage)
%% =====================

outer_Fbp = fsw / 20;              % Bandwidth Proportional Voltage (500 Hz)
outer_Fbi = outer_Fbp / 10;        % Bandwidth Integral Voltage (50 Hz)

outer_Kp  = 2 * pi * outer_Fbp * C;           % Kp_v = 2πfC
outer_Ki  = 2 * pi * outer_Fbi * outer_Kp;    % Ki_v = 2πf * Kp

%% =====================
% INNER LOOP (Current)
%% =====================

inner_Fbp = fsw / 200;              % Bandwidth Proportional Current (1 kHz)
inner_Fbi = inner_Fbp / 10;        % Bandwidth Integral Current (100 Hz)
inner_Fbd = inner_Fbp * 10;

inner_Kp  = 2 * pi * inner_Fbp * L;           % Kp_i = 2πfL
inner_Ki  = 2 * pi * inner_Fbi * inner_Kp;    % Ki_i = 2πf * Kp
inner_Kd  = 1 / (2 * pi * inner_Fbd * L);     % Kd_i ≈ 1 / (2πfL)






