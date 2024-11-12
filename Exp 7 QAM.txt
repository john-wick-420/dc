// Exp 7 M- ary QAM
clc; 
clear all; 
close all;
Eb = input("Enter the Energy per bit in Joules : "); 
No = input("Enter the PSD of Noise in micro Wa s/Hz : "); 
x = 0:0.001:(Eb/No); 
Pe_QAM = 0.5*erfc(sqrt(0.4*x)); 
plot(x, Pe_QAM);
xlabel("Signal-to-Noise Ratio (Eb/No)"); 
ylabel("Probability of Error (Pe)"); 
legend("Pe_QAM");
