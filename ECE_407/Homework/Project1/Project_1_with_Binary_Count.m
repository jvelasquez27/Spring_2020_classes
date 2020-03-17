clear all; clc; close all;

%================Training sets========================
ImageSet = loadMNISTImages('train-images-idx3-ubyte'); %Training Image Sets
TrainingLbl = loadMNISTLabels('train-labels-idx1-ubyte'); %Training Label Sets
TrainingLbl = TrainingLbl(1:20000,1);

TrainImage = round(ImageSet*255); 
% TrainingImg = transpose(trnImgSet);

%Changing into binary:
BinaryImg = zeros(784,8,20000);
TrnImgBin = zeros(6272,20000);

for i=1:20000
    BinaryImg(:,:,i)=de2bi(TrainImage(:,i));
    TrnImgBin(:,i) = reshape(transpose(BinaryImg(:,:,i)),1,[]);
end
TrnImgBin = transpose(TrnImgBin);
%==================Test Sets========================

tstImgSet = loadMNISTImages('t10k-images-idx3-ubyte'); 
testLbl = loadMNISTLabels('t10k-labels-idx1-ubyte'); %Test Label Set


% testImg = reshape(tstImgSet,[],784); %Test Image set 
%----------------------Bernoulli Distribution----------------------------

%first 
mu = zeros(10,6272);
sigma = zeros(6272,6272,10);
for a = 1:10
    mu(a,:) = mean(TrnImgBin(TrainingLbl==a-1,:));
    sigma(:,:,a) = cov(TrnImgBin(TrainingLbl==a-1,:));
%     sigma(:,:,a) = sigma(:,:,a) + .365*eye(784); %to solve the 
    %positive definite problem
end
