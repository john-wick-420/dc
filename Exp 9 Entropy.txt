// Exp 9 Entropy 
clc;
clear all;
close;

// Define probability vectors Px and Py
Px = [1/8 1/4 5/8];
x = length(Px);
disp("Number of rows in P(X):");
disp(x);

// Calculate entropy H(X)
Hx = 0;
for i = 1:x
    Hx = Hx + Px(i) * log2(1 / Px(i));
end
disp("Entropy of input message H(X) is:");
disp(Hx);

// Define probability vector Py
Py = [1/4 3/10 9/20];
y = length(Py);
disp("Number of rows in P(Y):");
disp(y);

// Calculate entropy H(Y)
Hy = 0;
for j = 1:y
    Hy = Hy + Py(j) * log2(1 / Py(j));
end
disp("Entropy of input message H(Y) is:");
disp(Hy);

// Define joint probability matrix P(X,Y)
Pxy = [3/40 1/40 1/40;
       1/20 3/20 1/20;
       1/8  1/8  3/8];

[n, m] = size(Pxy);

// Calculate joint entropy H(X,Y)
Hxy = 0;
for i = 1:n
    for j = 1:m
        Hxy = Hxy + Pxy(i, j) * log2(1 / Pxy(i, j));
    end
end
disp("Entropy of joint probability matrix H(X,Y) is:");
disp(Hxy);

// Calculate conditional entropies
Hx_y = Hxy - Hy;
disp("Conditional Entropy H(X|Y) when X is transmitted is:");
disp(Hx_y);

Hy_x = Hxy - Hx;
disp("Conditional Entropy H(Y|X) when Y is transmitted is:");
disp(Hy_x);

// Calculate mutual information I(X;Y)
I_xy = Hx + Hy - Hxy;
disp("Value of mutual information I(X;Y) is:");
disp(I_xy);
