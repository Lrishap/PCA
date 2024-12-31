file = load('city_water.txt'); %Loading the data set from the filepath
%Setting X as the name of the file
X = file;
%%%%%%%%%%%%%%%%
%Checking the size of the date
[m,n] = size(X);
c_t = (1:n)';
%%%Box Plot
%figure()
%boxplot(X,'Orientation','horizontal','Labels', c_t)
%legend('Ca', 'Sulf', 'PCB', 'Hg', 'Glo')
%xlabel('Measured Values')
%ylabel('Five Measured Quantities')

%Standard Deviation of the data set
SD = std(X);
%Mean of the data set
Mn = mean(X);
%Centered version of X
X_C_1 = X - ones(m,1) * Mn;
%Centered version of X, "X_C_1=X_C_2"
X_C_2 = bsxfun(@minus,X,Mn);
%Standardized version of X
X_s = X_C_1 ./ repmat(SD,m,1);
%%%%%%%%%%%%%%%%%
%Performing PCA using MATLAB command
[coeff,score,latent,tsquared,explained,mu] = pca(X_s);
%%%%%%%%%%%%%%%%%
%Peroforming self PCA calculations
%Covaraince matrix of the standardized version of X
V_s_1 = X_s' * X_s / (m-1);
%Covaraiance matrix "V_s_1=V_s_2"
V_s_2 = cov(X_s);
% Calculation of Eigenvectors/values of the covariance matrix
[E,D] = eig(V_s_2); 
%Check the eigenvalues D
%Sort the eigenvectors/values in descending order
[B, I] = sort(diag(D),'descend');
E_1 = E(:,I);
%Multiply the standardized data with the eigenvectors(principal component
%vectors) to get the projection on Principal Component Space
P = X_s*E_1;%Principal Components P 

%%%%Principal Components "P" from the calculations and "score" from pca
%%%%function are equal
%%%%Output "coeff", the principal component vectors, are the rearranged
%%%%eigenvectors "E_1"
%%%%Output "latent", the variances of the covariance matrix, are the rearranged
%%%%eigenvalues "B"
%%check the orthonormality of the coefficients of the principal components
L = coeff'*coeff;

%%Variance-Percentage Calculation
%pareto(latent)

%%Principal Components from pca command
x1 = score(:,1);
y1 = score(:,2);
z1 = score(:,3);
%%%Principal components from Self-Calculations
x2 = P(:,1);
y2 = P(:,2);
z2 = P(:,3);
%%Test with both the calculation
%Marking of the city using the gname command
%scatter(x1,y1,'o')
%xlabel('First Principal Component')
%ylabel('Second Principal Component')
%gname
%%Biplot of 2d and 3D principal components, with the variables
lbl = {'Glo','Hg','PCB','Sulf','Ca'}; % Labels for the variables
biplot(coeff(:,1:2),'Scores',score(:,1:2),'Color','b','Marker','o','VarLabels',lbl);





