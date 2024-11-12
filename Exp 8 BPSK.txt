// Exp 8 BPSK Noise Presence 
clc; 
clear all; 
close all;
Eb = input("Enter the Energy per bit in Joules: "); 
No = input("Enter the PSD of Noise in micro Wa s/Hz: "); 
x = 0:0.001:(Eb/No); 
Pe_BPSK = 0.5*erfc(sqrt(x)); 
plot(x, Pe_BPSK); 
xlabel("Signal-to-Noise Ratio (Eb/No)"); 
ylabel("Probability of Error (Pe)"); 
legend("Pe_BPSK");
