%{
  A script for fetching BodyTemperature data in .txt format
  and scatterplotting heart rate vs. body temperature 
%}

raw_data = fileread('BodyTemperature.txt');
rows = textscan(raw_data,'%s', 'Delimiter', '\n');
rows = rows{1, 1};
feature_names = textscan(rows{1}, '%s', 'Delimiter', ' '){1, 1};

m = size(rows, 1) - 1 # Sample size
n = size(feature_names, 1) # Number of featuress

# Take only two features body temperature and heart rate
X = zeros(m, 2);
for i = 1:m
    ith_row = textscan(rows{i + 1}, '%s', 'Delimiter', ' '){1, 1};
    X(i, :) = [str2num(ith_row{4}) str2num(ith_row{2})];
endfor

X_std = featureScale(X);

figure('Units', 'pixels', 'Position', [100, 100, 600, 400]);
plot(X_std(:, 1), X_std(:, 2), 'rx', 'MarkerSize', 10, 'LineWidth', 1.5)
xlabel('Heart rate');
ylabel('Temperature');
