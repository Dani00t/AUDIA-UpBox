clear
close all
clc

%% Grid convergence audiA4UpBox

n1 = 960049;

n2 = 3068987; 
n3 = 4221399;
n4 = 7480250;




cd1 = 0.342027;

cd2 = 0.33321;
cd3 = 0.337323;
cd4 = 0.337113;

celle = [n1, n2, n3 n4];
cd = [cd1, cd2, cd3, cd4];

figure;
plot(celle, cd, '-o', 'LineWidth', 2, 'MarkerSize', 8);
xlabel('Mesh elements');
ylabel('C_d');
title('Mesh convergence, C_d');
grid on;
