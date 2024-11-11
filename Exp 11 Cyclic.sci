// Exp 11 Cyclic Code 
clc; 
clear all; 

// Define message polynomial
m = [1 0 0 1]; 
k = length(m); 
n = 7; 

// Define x as a polynomial variable
x = poly(0, "x"); 
m_x = m(1)*x^3 + m(2)*x^2 + m(3)*x + m(4)*1; 
disp("Coefficients of message Polynomial:");
disp(coeff(m_x));

// Define generator polynomial g(x)
g_x = x^3 + x + 1; 
disp("Coefficients of generator Polynomial:");
disp(coeff(g_x));

// Calculate word polynomial w(x)
w_x = x^(n - k) * m_x; 
disp("Product of word Polynomial & generator Polynomial:");
disp(coeff(w_x));

// Perform polynomial division
[r_x, q] = pdiv(w_x, g_x); 
c_x = w_x + r_x; 
disp("Code word Polynomial:");
disp(coeff(c_x));

// Display coefficients of codeword and remainder
CS = coeff(c_x); 
disp("Codeword coefficients:");
disp(CS); 

p = coeff(r_x); 
disp("Remainder in polynomial form:");
disp(p); 

// Define error polynomial E(x)
E = [1 0 0 0 0 0 0]; 
E_x = E(1)*x^6 + E(2)*x^5 + E(3)*x^4 + E(4)*x^3 + E(5)*x^2 + E(6)*x + E(7)*1; 
disp("Coefficients of error Polynomial:");
disp(coeff(E_x));

// Received polynomial R(x)
R_x = c_x + E_x; 
disp("Coefficients of Received Polynomial:");
disp(coeff(R_x));

// Perform polynomial division on received polynomial
[r1, q1] = pdiv(R_x, g_x); 
disp("Remainder r1 of received polynomial:");
disp(coeff(r1));

S1 = coeff(r1); 
S1 = modulo(S1, 2); 
disp("Syndrome S1 bits for received polynomial:");
disp(S1);

// Perform polynomial division on error polynomial
[r2, q2] = pdiv(E_x, g_x); 
S2 = coeff(r2); 
S2 = modulo(S2, 2); 
disp("Remainder r2 of error polynomial:");
disp(coeff(r2));

disp("Syndrome S2 bits for error polynomial:");
disp(S2);

// Check for errors
if (sum(S1) == 0 & sum(S2) == 0) then
    disp("Correct code word");
else
    disp("Received code word has an error");
end

// Display the corrected code word
disp("Correct code word is:");
CC = R_x + E_x; 
SS = coeff(CC); 
SS = modulo(SS, 2); 
disp(SS);
