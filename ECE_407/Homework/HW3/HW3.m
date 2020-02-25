clear all; clc; close all;
%
x = [2 4 0 7 1 2 0 3 2 1 5 4 3]; %sample set
X = [-3 -2 -1 0 1 2 3 4 5 6 7 8 9];

xMu = mean(x);
xVar = var(x);

pdf = zeros(1,size(X,2));
for i=1:size(X,2)
    pdf(i) = mvnpdf(X(1,i),xMu,xVar);
end

% figure(1)
% stem(-3:9,pdf);title('Normal Distribution');

%============================================

V = [1 2 2 3 1.5 2 1 1 2;2 3 4 4 5 5 5 4 2];
x1 = [1 2 2 3 1.5 2 1 1 2];
x2 = [2 3 4 4 5 5 5 4 2];
vMu1 = mean(V(1,:));
vMu2 = mean(V(2,:));
mu = [vMu1;vMu2];
vCov = cov(V(1,:),V(2,:));
% sigma = vCov + .1*eye(9);% fixing positive semi-definite problem
pdf2 = zeros(2,size(V,2));

for i=1:2
    for j=1:size(V,2)
        pdf2(i,j) = mvnpdf(V(:,j),mu(i),vCov);
    end
end

% for j=1:size(V,2)
%         pdf2(:,j) = mvnpdf(V(:,j),mu,vCov);
% end
% y = mvnpdf(X,mu,sigma);
% y = reshape(pdf2,length(x2),length(x1));

