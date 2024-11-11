// Exp 11 LBC - Linear Block Code Example

clear all; 
clc; 

// Define the message vector (could also be input from user)
m = [1 1 1 1]; 

// Define the Parity matrix P (usually predetermined or input from the user)
P = [1 1 1; 1 1 0; 0 1 1; 1 0 1]; 
disp(P, "Parity Matrix P");  // Display the parity matrix P

// Length of the message vector m
k = length(m); 

// Identity matrix of size k (for the generator matrix)
I = eye(k, k); 
disp(I, "Identity Matrix I");  // Display identity matrix I

// Generator matrix G = [I | P] (append P to identity matrix I)
G = [I P]; 
disp(G, "Generator matrix G");  // Display the generator matrix G

// Calculate the code word C using modulo-2 multiplication
C = modulo(m * G, 2); 
disp(C, "Code word Message C");  // Display the generated code word C

// Input received codeword with one-bit error (length n)
Er = input('Enter the one bit error containing codeword of length n: '); 
disp(Er, "One bit error containing codeword Error_codeword");  // Display the received codeword with error

// Length of the received codeword
n = length(Er);

// Create an identity matrix of size (n-k) to complete the parity check matrix
z = eye(n - k, n - k); 
disp(z, "Identity Matrix z");  // Display the identity matrix z

// Construct the Parity check matrix H = [P' | z] (transpose of P followed by z)
H = [P' z]; 
disp(H, "Parity check matrix H");  // Display the parity check matrix H

// Compute the syndrome matrix S = (Er * H') mod 2
S = modulo(Er * H', 2); 
disp(S, "Syndrome Matrix S");  // Display the syndrome matrix S

// Transpose of the parity check matrix
HT = H'; 

// Check if the syndrome is all zeros (i.e., no error detected)
if (S == 0) then
    disp("Correct");  // No error detected in the received codeword
else
    disp("Received code vector is with error");  // Error detected in the received codeword
    
    // Loop through all rows of the transpose of H to find the error pattern
    for i = 1:n
        if (S == HT(i, :)) then
            // If the syndrome matches a row of HT, correct the error
            e = [zeros(1, i - 1) 1 zeros(1, n - i)];  // Error pattern (single bit error at position i)
            disp(e);  // Display the error pattern e
        end
    end
end

// Display the corrected code word
disp("Correct code word is"); 
CC = modulo(Er + e, 2);  // Correct the received codeword by adding the error pattern
disp(CC);  // Display the corrected codeword
