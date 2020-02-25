clear all;clc;close all;

A = [-2 -2.5 0; 4 0 0; 0 0 -1];
B = [2;0;1];
C = [0 1.25 0;0 0 1];
D = [0;0];

sys1 = ss(A,B,C,D);
G = tf(sys1);

figure(1)
subplot(1,2,1)
step(G(1),'r');hold on; step(G(2)); hold off;title('Step Response'); grid on;
subplot(1,2,2)
pzmap(G(1),'r');hold on; pzmap(G(2)); hold off;title('Pole-Zero Mapping'); grid on;
legend('Output 1','Output 2');

%==============Part III===================
num = {10 ; 1};
den = {[1 2 10];[1 1]};

sys2 = tf(num,den);

figure(2)
subplot(1,2,1)
step(sys2(1),'r');hold on; step(sys2(2)); hold off;title('Step Response'); grid on;
subplot(1,2,2)
pzmap(sys2(1),'r');hold on; pzmap(sys2(2)); hold off;title('Pole-Zero Mapping'); grid on;
legend('Output 1','Output 2');
