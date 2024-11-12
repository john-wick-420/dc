// Exp 6 PSK
clc; 
clear all; 
close all;
Eb = input("Enter the Energy per bit in Joules : ");
No = input("Enter the PSD of Noise in micro Wa s/Hz : "); 
M = input("Enter the no. of symbol : ");
x=0:0.001:(Eb/No);
Pe_MaryPSK = erfc(sqrt(x).*sind(180/M)); 
plot(x, Pe_MaryPSK);
xlabel("Signal-to-Noise Ratio (Eb/No)"); 
ylabel("Probability of Error (Pe)"); 
legend("Pe_MaryPSK");
