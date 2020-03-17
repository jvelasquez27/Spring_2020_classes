clear all; clc; close all;

%================Training sets========================
ImageSet = loadMNISTImages('train-images-idx3-ubyte'); %Training Image Sets
TrainingLbl = loadMNISTLabels('train-labels-idx1-ubyte'); %Training Label Sets

%Reversing the Normalization
TrainImage = round(ImageSet*255); 
% Quantization:
for i=1:60000
    for j = 1:784
        if (TrainImage(j,i) < 128)
            TrainImage(j,i) = 0;
        else 
            TrainImage(j,i) = 1;
        end
    end
end
TrainImage = transpose(TrainImage);
%==================Test Sets========================

tstImgSet = loadMNISTImages('t10k-images-idx3-ubyte'); 
testLbl = loadMNISTLabels('t10k-labels-idx1-ubyte'); %Test Label Set

% testImg = reshape(tstImgSet,[],784); %Test Image set 
%----------------------Bernoulli Distribution----------------------------
%calculate the mean and covariance;

mu = zeros(10,784);
sigma = zeros(784,784,10);
for a = 1:10
    mu(a,:) = mean(TrainImage(TrainingLbl==a-1,:));
    sigma(:,:,a) = cov(TrainImage(TrainingLbl==a-1,:));
    sigma(:,:,a) = sigma(:,:,a) + .365*eye(784); %to solve the 
    %positive definite problem
end

%we would have 10 different mus and sigmas for each of the label

% determining the normal distribution
pdf = zeros(60000,10);
for i=1:10
    pdf(:,i) = mvnpdf(TrainImage,mu(i,:),abs(sigma(:,:,i)));
end

%doing the argmax of the pdf:
TrnDgtLoc = zeros(1,60000);
TrnProbMax = zeros(1,60000);

for i = 1:60000
    [TrnProbMax(1,i),TrnDgtLoc(1,i)]=max(pdf(i,:));
end
