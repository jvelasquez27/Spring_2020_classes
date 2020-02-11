clear all; clc; close all;

%=============Part I==================

%construct the transfer function with p = 1,2,10

% G1 = tf([1],[1 1]);
% G2 = tf([2],[1 2]);
% G10 = tf([10],[1 10]);
% 
% step(G1)
% hold on
% step(G2)
% hold on
% step(G10)
% hold off 
% title('Step Response')
% legend('p = 1','p = 2','p = 10')

%===============Part II section a===============

% K = 1;
% G0 = tf([K],[1 0 K]);
% G1 = tf([K],[1 1 K]);
% G2 = tf([K],[1 2 K]);
% G5 = tf([K],[1 5 K]);
% 
% subplot(1,2,1)
% step(G0)
% hold on
% step(G1)
% hold on
% step(G2)
% hold on
% step(G5)
% hold off
% title('Step Response')
% legend('p = 0','p = 1','p = 2', 'p = 5');
% 
% subplot(1,2,2)
% pzmap(G0)
% hold on
% pzmap(G1)
% hold on
% pzmap(G2)
% hold on
% pzmap(G5)
% hold off
% title('Pole-Zero Map')
% grid on
% legend('p = 0','p = 1','p = 2', 'p = 5');

%================Part II section b======================

% K1 = 1;
% K2 = 2;
% K10 = 10;
% 
% p1 = 0.8*K1;
% p2 = 0.8*K2;
% p10 = 0.8*K10;
% 
% G1 = tf((K1),[1 p1 K1]);
% G2 = tf((K2),[1 p2 K2]);
% G10 = tf((K10),[1 p10 K10]);
% 
% subplot(1,2,1)
% step(G1)
% hold on
% step(G2)
% hold on
% step(G10)
% hold off
% title('Step Response')
% grid on
% legend('p = 1','p = 2', 'p = 10');
% 
% subplot(1,2,2)
% pzmap(G1)
% hold on
% pzmap(G2)
% hold on
% pzmap(G10)
% hold off
% title('Pole-Zero Map')
% grid on
% legend('p = 1','p = 2', 'p = 10');

%==============Part III===============

gamma0 = 0;
gamma1 = 0.1;
gamma2 = 1;
gamma3 = 10;

G0 = tf([gamma0 1],[1 1.2 1]);
G1 = tf([gamma1 1],[1 1.2 1]);
G2 = tf([gamma2 1],[1 1.2 1]);
G3 = tf([gamma3 1],[1 1.2 1]);

subplot(1,2,1)
step(G0)
hold on
step(G1)
hold on
step(G2)
hold on
step(G3)
hold off
title('Step Response')
grid on
legend('p = 0','p = 0.1','p = 1', 'p = 10');

subplot(1,2,2)
pzmap(G0)
hold on
pzmap(G1)
hold on
pzmap(G2)
hold on
pzmap(G3)
hold off
title('Pole-Zero Map')
grid on
legend('p = 0','p = 0.1','p = 1', 'p = 10');

%=================Part IV=====================

% gamma1 = 0;
% gamma2 = .05;
% gamma3 = .1;
% gamma4 = 1;
% gamma5 = 10;
% 
% d1 = gamma1 + 1;
% d2 = gamma2 + 1;
% d3 = gamma3 + 1;
% d4 = gamma4 + 1;
% d5 = gamma5 + 1;
% 
% G1 = tf ( 1,[gamma1 d1 d1 1]);
% G2 = tf ( 1,[gamma1 d2 d2 1]);
% G3 = tf ( 1,[gamma1 d3 d3 1]);
% G4 = tf ( 1,[gamma1 d4 d4 1]);
% G5 = tf ( 1,[gamma1 d5 d5 1]);
% 
% subplot(1,2,1)
% step(G1)
% hold on
% step(G2)
% hold on
% step(G3)
% hold on
% step(G4)
% hold on
% step(G5)
% hold off
% title('Step Response')
% grid on
% legend('p=0','p=0.5','p=0.1','p=1','p=10')
% 
% subplot(1,2,2)
% pzmap(G1)
% hold on
% pzmap(G2)
% hold on
% pzmap(G3)
% hold on
% pzmap(G4)
% hold on
% pzmap(G5)
% hold off
% title('Pole-Zero Map')
% grid on
% legend('p=0','p=0.5','p=0.1','p=1','p=10')