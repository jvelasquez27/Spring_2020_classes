clear all; clc; close all;
%===============Problem 3===================
x = [2 4 0 7 1 2 0 3 2 1 5 4 3]; %sample set
X = [-3 -2 -1 0 1 2 3 4 5 6 7 8 9];

xMu = mean(x);
xVar = var(x);

pdf = zeros(1,size(X,2));
for i=1:size(X,2)
    pdf(i) = mvnpdf(X(1,i),xMu,xVar);
end

figure(1)
scatter(-3:9,pdf,'filled');title('Normal Distribution');

%=============Problem 4===============================

V = [1 2 2 3 1.5 2 1 1 2;2 3 4 4 5 5 5 4 2];
x1 = [1 2 2 3 1.5 2 1 1 2];
x2 = [2 3 4 4 5 5 5 4 2];

vMu1 = mean(V(1,:));
vMu2 = mean(V(2,:));
mu = [vMu1 vMu2];
vCov = cov(V(1,:),V(2,:));

x1 = -2:.2:8;
x2 = -2:.2:8;
[X1,X2] = meshgrid(x1,x2);
X = [X1(:) X2(:)];

pdf2 = mvnpdf(X,mu,vCov);
pdf2 = reshape(pdf2,length(x1),length(x2));

figure(2)
surf(x1,x2,pdf2)
caxis([min(pdf2(:))-0.5*range(pdf2(:)),max(pdf2(:))]);

xlabel('x1')
ylabel('x2')
zlabel('Probability Density')
