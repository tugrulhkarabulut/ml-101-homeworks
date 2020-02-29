%{
  A script for reading BodyTemperature Gender data from a file
  And create a box plot and detect outliers.
%}


# Load data
data = csv2cell('BodyTemperature_GenderTemperature.csv');
# Discard headers
data = data(2:end, :);
# data size
[m, n] = size(data);

X = zeros(m, n);

for i = 1:m
  gender = data{i, 1};
  gender = gender == 'F';
  
  X(i, :) = [gender, data{i, 2}];
endfor


X_men = X( X(:, 1) == 0, 2 );
X_women = X( X(:, 1) == 1, 2 );

figure;
boxplot(X_men);
figure;
boxplot(X_women);
# From the figures, 101.3 is the outlier for men, 100.8 is for women

printf('Outliers of men: \n')
detectOutlier(X_men)
printf('Outliers of women: \n')
detectOutlier(X_women)








