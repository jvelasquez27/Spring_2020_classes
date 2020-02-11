clear all; clc; close all;

G = tf([1 2],[1 1 0]);
H = tf([.1],[1 1]);

Output = G /(1 + G*H);
subplot(1,2,1)
pzmap(Output)
grid on
subplot(1,2,2)
step(Output)
grid on