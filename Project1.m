clear all; clc; close all;

%================Training sets========================
trnImgSet = loadMNISTImages('train-images-idx3-ubyte'); %Training Image Sets
TrainingLbl = loadMNISTLabels('train-labels-idx1-ubyte'); %Training Label Sets


% TrainingImg = reshape(trnImgSet,28, 28, 60000);
% for i = 1:60000
%     TrainingImg(:,:,i) = flip(transpose(TrainingImg(:,:,i)));
% end
% TrainingImg1 = reshape(TrainingImg,784,60000);
% TrainingImg = transpose(TrainingImg1);

TrainingImg = transpose(trnImgSet);
% TrainingImg = transpose(trnImgSet);


%Quantization:
% for i=1:60000
%     for j = 1:784
%         if (TrainingImg(i,j) < 0.5)
%             TrainingImg(i,j) = 0;
%         else 
%             TrainingImg(i,j) = 1;
%         end
%     end
% end
%==================Test Sets========================

tstImgSet = loadMNISTImages('t10k-images-idx3-ubyte'); 
testLbl = loadMNISTLabels('t10k-labels-idx1-ubyte'); %Test Label Set

% testImg = reshape(tstImgSet,[],784); %Test Image set 
%----------------------Bernoulli Distribution----------------------------
%calculate the mean and covariance;

mu = zeros(10,784);
sigma = zeros(784,784,10);
% Var = zeros(10,784);
for a = 1:10
    mu(a,:) = mean(TrainingImg(TrainingLbl==a-1,:));
    sigma(:,:,a) = cov(TrainingImg(TrainingLbl==a-1,:));
%     Var(a,:) = var(TrainingImg(TrainingLbl==a-1,:));
    sigma(:,:,a) = sigma(:,:,a) + 0.37*eye(784); %to solve the 
    %positive definite problem
end
%we would have 10 different mus and sigmas for each of the label

% determining the normal distribution
% p = zeros(60000,10);
for i=1:10
    for j =1:60000
        pdf(j,i) = mvnpdf(TrainingImg(j,:),mu(i,:),abs(sigma(:,:,i)));
    end
end

