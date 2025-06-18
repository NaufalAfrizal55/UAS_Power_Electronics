Vin = 24 
Vout = 12
D = 0.5
fsw = 10e3
Rload = 2.4
IL = Vout/Rload
Iout_ripple = 0.2 * IL
Vout_ripple = 0.02 * Vout

L = (Vout * (1 - D)) / (Iout_ripple * fsw)    # 6e-4
C = (Vout * (1 - D)) / (8 * L * fsw^2 * Vout_ripple)    #52e-6