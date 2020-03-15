clear all; clc; close all;
Img = double(imread('lenna.bmp'));
% grayImg = rgb2gray(Img);

H = (1/13)*[0 0 1 0 0;
         0 1 1 1 0;
         1 1 1 1 1;
         0 1 1 1 0;
         0 0 1 0 0];
% imgBlur = conv2(grayImg,H);
imgBlur = imfilter(Img,H);
[width,heigth]=size(imgBlur);

%------Weiner Equation--------------
%------ [x(n) = d + v(b)] 
noise = sqrt(1000)*rand(width,heigth);
x = imgBlur + noise; % blurred signal with noise
X = fft2(x);
%--------autocorrelation of signal x (Rx(k))----------
Rx = xcorr2(x,1:256,1:256);
%---------auto correlation of x and d (Rdx(k))-------------

Rdx = xcorr2(x,imgBlur);
%------Determining the Weiner coefficient-----
% w = (Rx.^-1).*Rdx;
w = inv(Rx)*Rdx;
W = fftshift(fft2(w));
%----------Estimating the Desired signal----------------
% ds = conv2(w,x);
% ds = imfilter(w,x,'conv');
Ds = W.*X;
ds = ifft2(fftshift(Ds));
%----------------Figures---------------------
figure(1)
subplot(2,2,1)
imagesc(Img);colormap gray ;title('Original lenna.bmp');
subplot(2,2,2)
imagesc(imgBlur);colormap gray ;title('Image with blue effect');
subplot(2,2,3)
imagesc(x);colormap gray ;title('Observed signal with blur and noise');
subplot(2,2,4)
imagesc(ds);colormap gray ;title('Expected Desired signal');
